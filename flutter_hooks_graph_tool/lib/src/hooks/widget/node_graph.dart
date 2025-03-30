import 'package:flutter/material.dart';
import '../nodes_state.dart';
import 'node_view.dart';

class HookNodeGraph extends StatefulWidget {
  const HookNodeGraph({super.key});

  @override
  State<HookNodeGraph> createState() => _HookNodeGraphState();
}

class _HookNodeGraphState extends State<HookNodeGraph> {
  final _selectedNode = ValueNotifier<HookNode?>(null);
  final _scale = ValueNotifier<double>(1.0);
  final _offset = ValueNotifier<Offset>(Offset.zero);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<HookNode>>(
      valueListenable: hookNodes,
      builder: (context, nodes, child) {
        return GestureDetector(
          onScaleStart: (details) {
            // スケール開始時の処理
          },
          onScaleUpdate: (details) {
            _scale.value *= details.scale;
            _offset.value += details.localFocalPoint;
          },
          child: Stack(
            children: [
              // 背景グリッド
              Positioned.fill(child: CustomPaint(painter: GridPainter())),
              // ノード間の接続線
              ..._buildConnections(nodes),
              // ノード
              ...nodes.map((node) => _buildNode(node)),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildConnections(List<HookNode> nodes) {
    final connections = <Widget>[];
    for (final node in nodes) {
      if (node.dependencies != null) {
        for (final depId in node.dependencies!) {
          final depNode = nodes.firstWhere(
            (n) => n.id == depId,
            orElse: () => node,
          );
          connections.add(
            CustomPaint(
              painter: ConnectionPainter(
                from: _getNodePosition(depNode),
                to: _getNodePosition(node),
              ),
            ),
          );
        }
      }
    }
    return connections;
  }

  Widget _buildNode(HookNode node) {
    return ValueListenableBuilder<HookNode?>(
      valueListenable: _selectedNode,
      builder: (context, selectedNode, child) {
        final isSelected = selectedNode?.id == node.id;
        return Positioned(
          left: _getNodePosition(node).dx,
          top: _getNodePosition(node).dy,
          child: HookNodeView(
            node: node,
            isSelected: isSelected,
            onTap: () => _selectedNode.value = isSelected ? null : node,
          ),
        );
      },
    );
  }

  Offset _getNodePosition(HookNode node) {
    // ここでノードの位置を計算
    // 実際の実装では、より複雑なレイアウトアルゴリズムを使用する
    return Offset(node.id * 150.0, node.type.hashCode % 3 * 150.0);
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey.withOpacity(0.2)
          ..strokeWidth = 1;

    const gridSize = 20.0;
    for (var i = 0.0; i < size.width; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (var i = 0.0; i < size.height; i += gridSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ConnectionPainter extends CustomPainter {
  final Offset from;
  final Offset to;

  ConnectionPainter({required this.from, required this.to});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey.withOpacity(0.5)
          ..strokeWidth = 2;

    canvas.drawLine(from, to, paint);
  }

  @override
  bool shouldRepaint(covariant ConnectionPainter oldDelegate) {
    return oldDelegate.from != from || oldDelegate.to != to;
  }
}
