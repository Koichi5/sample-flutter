import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'family_screen_controller.g.dart';

@riverpod
int familyScreenController(FamilyScreenControllerRef ref, int num1, int num2) {
  return num1 + num2;
}
