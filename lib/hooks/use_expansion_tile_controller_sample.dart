import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseExpansionTileControllerSample extends HookWidget {
  const UseExpansionTileControllerSample({super.key});

  @override
  Widget build(BuildContext context) {
    final expansionController = useExpansionTileController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('useExpansionTileController サンプル'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ExpansionTile(
              title: const Text('詳細情報'),
              initiallyExpanded: false,
              onExpansionChanged: (expanded) {
                if (expanded) {
                  expansionController.expand();
                } else {
                  expansionController.collapse();
                }
              },
              children: const [
                ListTile(
                  title: Text('ここに詳細情報が表示されます。'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}