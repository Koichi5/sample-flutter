import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseValueChangedSample extends HookWidget {
  const UseValueChangedSample({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useState<String>('');
    final isValid = useState<bool>(false);

    // useValueChanged を使用して email.value の変化を監視
    useValueChanged<String, void>(
      email.value,
      (_, previousEmail) {
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
        isValid.value = emailRegex.hasMatch(email.value);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('useValueChanged サンプル'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'メールアドレス',
                border: const OutlineInputBorder(),
                suffixIcon: Icon(
                  isValid.value ? Icons.check_circle : Icons.error,
                  color: isValid.value ? Colors.blue : Colors.red,
                ),
              ),
              onChanged: (value) {
                email.value = value;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            Text(
              isValid.value ? '有効なメールアドレスです。' : '無効なメールアドレスです。',
              style: TextStyle(
                color: isValid.value ? Colors.blue : Colors.red,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
