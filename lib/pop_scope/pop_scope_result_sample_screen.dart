import 'package:flutter/material.dart';

class PopScopeResultSampleScreen extends StatelessWidget {
  const PopScopeResultSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('メイン画面')),
      body: Center(
        child: ElevatedButton(
          child: const Text('編集画面へ'),
          onPressed: () async {
            final result = await Navigator.push<EditResult>(
              context,
              MaterialPageRoute(builder: (context) => const EditScreen()),
            );

            if (result != null) {
              switch (result) {
                case EditResult.save:
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('変更を保存しました')),
                  );
                  break;
                case EditResult.discard:
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('変更を破棄しました')),
                  );
                  break;
                case EditResult.cancel:
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('編集をキャンセルしました')),
                  );
                  break;
              }
            }
          },
        ),
      ),
    );
  }
}

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope<EditResult>(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;

        final choice = await showDialog<EditResult>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('変更を保存しますか？'),
              actions: <Widget>[
                TextButton(
                  child: const Text('保存'),
                  onPressed: () => Navigator.of(context).pop(EditResult.save),
                ),
                TextButton(
                  child: const Text('破棄'),
                  onPressed: () =>
                      Navigator.of(context).pop(EditResult.discard),
                ),
                TextButton(
                  child: const Text('キャンセル'),
                  onPressed: () => Navigator.of(context).pop(EditResult.cancel),
                ),
              ],
            );
          },
        );

        if (choice != null && choice != EditResult.cancel) {
          if (!context.mounted) return;
          Navigator.of(context).pop(choice);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('編集画面')),
        body: const Center(
          child: Text('ここで編集を行います'),
        ),
      ),
    );
  }
}

enum EditResult {
  save,
  discard,
  cancel,
}
