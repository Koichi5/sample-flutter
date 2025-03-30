import 'package:flutter/material.dart';
import 'package:flutter_hooks_graph_tool/src/hooks/flutter_hooks_graph_tool.dart';

void main() {
  runApp(const FlutterHooksGraphToolExtension());
}

class FlutterHooksGraphToolExtension extends StatelessWidget {
  const FlutterHooksGraphToolExtension({super.key});

  @override
  Widget build(BuildContext context) {
    return const FlutterHooksDevToolsExtension();
  }
}
