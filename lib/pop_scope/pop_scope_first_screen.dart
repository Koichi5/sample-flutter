import 'package:flutter/material.dart';
import 'package:sample_flutter/pop_scope/pop_scope_second_screen.dart';

class PopScopeFirstScreen extends StatelessWidget {
  const PopScopeFirstScreen({super.key});

  static const name = 'Flutter';
  static const email = 'flutter@gmail.com';
  static const password = 'flutter1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
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
            _buildInfoSection(context, '名前', name),
            _buildInfoSection(context, 'メールアドレス', email),
            _buildInfoSection(context, 'パスワード', password),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => _navigateToEditScreen(context),
                child: const Text('編集画面へ'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  void _navigateToEditScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PopScopeSecondScreen(
          name: name,
          email: email,
          password: password,
        ),
      ),
    );
  }
}
