// Copyright 2023 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';
import 'nodes_state.dart';
import 'widget/node_graph.dart';

// DevTools拡張機能のエントリーポイント
class FlutterHooksDevToolsExtension extends StatelessWidget {
  const FlutterHooksDevToolsExtension({super.key});

  @override
  Widget build(BuildContext context) {
    return const DevToolsExtension(child: FlutterHooksGraphTool());
  }
}

class FlutterHooksGraphTool extends StatefulWidget {
  const FlutterHooksGraphTool({super.key});

  @override
  State<FlutterHooksGraphTool> createState() => _FlutterHooksGraphToolState();
}

class _FlutterHooksGraphToolState extends State<FlutterHooksGraphTool> {
  Function? _cancelSubscription;

  @override
  void initState() {
    super.initState();
    _cancelSubscription = initHookNodes();
    refreshHookNodes();
  }

  @override
  void dispose() {
    _cancelSubscription?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ツールバー
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: refreshHookNodes,
                  tooltip: 'Refresh Hooks',
                ),
                const SizedBox(width: 8),
                Text(
                  'Flutter Hooks Graph Tool',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          // メインコンテンツ
          Expanded(
            child: ValueListenableBuilder<List<HookNode>>(
              valueListenable: hookNodes,
              builder: (context, nodes, child) {
                if (nodes.isEmpty) {
                  return const Center(child: Text('No Hooks detected'));
                }
                return const HookNodeGraph();
              },
            ),
          ),
        ],
      ),
    );
  }
}
