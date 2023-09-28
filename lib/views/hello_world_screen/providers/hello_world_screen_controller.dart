import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_world_screen_controller.g.dart';

@riverpod
String helloWorldScreenController(HelloWorldScreenControllerRef ref) {
  return 'Hello World';
}
