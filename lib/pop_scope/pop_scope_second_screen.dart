import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PopScopeSecondScreen extends HookWidget {
  const PopScopeSecondScreen({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(text: name);
    final emailController = useTextEditingController(text: email);
    final passwordController = useTextEditingController(text: password);

    bool isEdited() {
      return nameController.text != name ||
          emailController.text != email ||
          passwordController.text != password;
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (!isEdited()) {
          Navigator.pop(context);
        } else {
          final bool? shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('変更を破棄しますか？'),
              content: const Text('未保存の変更があります。本当に戻りますか？'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('キャンセル'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('破棄して戻る'),
                ),
              ],
            ),
          );
          if (shouldPop ?? false) {
            if (!context.mounted) return;
            Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ユーザー情報',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              _buildInfoSection(
                context: context,
                label: '名前',
                value: name,
                controller: nameController,
              ),
              _buildInfoSection(
                context: context,
                label: 'メールアドレス',
                value: email,
                controller: emailController,
              ),
              _buildInfoSection(
                context: context,
                label: 'パスワード',
                value: password,
                controller: passwordController,
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Saved');
                    // ここで保存処理を行う
                  },
                  child: const Text('保存'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required BuildContext context,
    required String label,
    required String value,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
