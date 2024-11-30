import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// HookWidgetで使用するカスタムHook
SnackBarController useSnackBar() {
  final context = useContext();
  return SnackBarController(context: context);
}

// スナックバーを出すクラス
class SnackBarController {
  final BuildContext context;

  SnackBarController({required this.context});

  void show(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.green, content: Text(message)),
    );
  }
}

class CustomHook extends HookWidget {
  const CustomHook({super.key});

  @override
  Widget build(BuildContext context) {
    final context = useContext();
    final theme = Theme.of(context);
    final snackBarController = useSnackBar();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColorDark,
        title: const Text('Custom Hook'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => snackBarController.show('Hello, World!'),
          child: const Text('Show SnackBar'),
        ),
      ),
    );
  }
}