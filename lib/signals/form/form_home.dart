import 'package:flutter/material.dart';
import 'package:sample_flutter/signals/form/hooks_form.dart';
import 'package:sample_flutter/signals/form/signals_form.dart';

class FormHome extends StatelessWidget {
  const FormHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hooks Graph Tool😀😃'),
      ),
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HooksForm(
                      initialName: 'John Doe',
                      initialEmail: 'john.doe@example.com',
                    ),
                  ),
                );
              },
              child: const Text('Hooks Form'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignalsForm(
                      initialName: 'John Doe',
                      initialEmail: 'john.doe@example.com',
                    ),
                  ),
                );
              },
              child: const Text('Signals Form'),
            ),
          ],
        ),
      ),
    );
  }
}
