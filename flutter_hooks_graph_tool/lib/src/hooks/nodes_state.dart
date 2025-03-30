import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/foundation.dart';

// Hookの状態を表すクラス
class HookNode {
  final int id;
  final String type; // useState, useEffect, useMemo など
  final String? label;
  final String? value;
  final List<int>? dependencies; // 依存関係のHook ID
  final DateTime createdAt;

  HookNode({
    required this.id,
    required this.type,
    this.label,
    this.value,
    this.dependencies,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory HookNode.fromJson(Map<String, dynamic> json) {
    return HookNode(
      id: json['id'] as int,
      type: json['type'] as String,
      label: json['label'] as String?,
      value: json['value'] as String?,
      dependencies: (json['dependencies'] as List?)?.cast<int>(),
      createdAt:
          json['createdAt'] != null
              ? DateTime.parse(json['createdAt'] as String)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'label': label,
      'value': value,
      'dependencies': dependencies,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

// 状態管理用のグローバル変数
final hookNodes = ValueNotifier<List<HookNode>>([]);
final hookNodeAdd = ValueNotifier<HookNode?>(null);
final hookNodeUpdate = ValueNotifier<HookNode?>(null);
final hookNodeRemove = ValueNotifier<HookNode?>(null);
final reassembleCount = ValueNotifier<int>(0);

// DevTools拡張機能のイベントハンドラを初期化
Function? initHookNodes() {
  final subscription = serviceManager.service?.onExtensionEvent
      .where((e) => e.extensionKind?.startsWith('ext.hooks') ?? false)
      .listen((event) {
        final kind = event.extensionKind;
        final data = event.extensionData?.data ?? {};

        switch (kind) {
          case 'ext.hooks.hookCreate':
            final node = HookNode.fromJson(data);
            final currentNodes = List<HookNode>.from(hookNodes.value);
            currentNodes.add(node);
            hookNodes.value = currentNodes;
            hookNodeAdd.value = node;
            break;

          case 'ext.hooks.hookUpdate':
            final node = HookNode.fromJson(data);
            final currentNodes = List<HookNode>.from(hookNodes.value);
            final index = currentNodes.indexWhere((n) => n.id == node.id);
            if (index != -1) {
              currentNodes[index] = node;
              hookNodes.value = currentNodes;
              hookNodeUpdate.value = node;
            }
            break;

          case 'ext.hooks.hookRemove':
            final node = HookNode.fromJson(data);
            final currentNodes = List<HookNode>.from(hookNodes.value);
            currentNodes.removeWhere((n) => n.id == node.id);
            hookNodes.value = currentNodes;
            hookNodeRemove.value = node;
            break;

          case 'ext.hooks.reassemble':
            final items = (data['nodes'] as List?) ?? [];
            final results =
                items.map((item) => HookNode.fromJson(item)).toList();
            hookNodes.value = results;
            reassembleCount.value++;
            break;

          default:
            break;
        }
      });
  return subscription?.cancel;
}

// 全てのHookノードを取得
Future<void> refreshHookNodes() async {
  try {
    final response = await serviceManager.callServiceExtensionOnMainIsolate(
      'ext.hooks.getAllNodes',
    );
    final items = (response.json?['nodes'] as List?) ?? [];
    final results = items.map((item) => HookNode.fromJson(item)).toList();
    hookNodes.value = results;
    reassembleCount.value++;
  } catch (e) {
    debugPrint('Error fetching all hooks: $e');
  }
}
