import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/views/hello_world_screen/providers/hello_world_screen_controller.dart';

class HelloWorldScreen extends ConsumerWidget {
  const HelloWorldScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerValue = ref.watch(helloWorldScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(controllerValue)),
      body: Center(child: Text(controllerValue)),
    );
  }
}
