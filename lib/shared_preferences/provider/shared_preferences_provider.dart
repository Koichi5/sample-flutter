// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// part 'shared_preferences_provider.g.dart';

// @riverpod
// class SharedPreferencesController extends _$SharedPreferencesController {
//   static SharedPreferences? prefs;

//   @override
//   Future<void> build() async {
//     print('shared preferences provider build fired');
//     prefs = await SharedPreferences.getInstance();
//   }

// Future<void> setValue({required String key, required Object value}) async {
//   final valueType = value.runtimeType;
//   switch (valueType) {
//     case String:
//       await prefs?.setString(key, value as String);
//       break;
//     case int:
//       await prefs?.setInt(key, value as int);
//       break;
//     case double:
//       await prefs?.setDouble(key, value as double);
//       break;
//     case bool:
//       await prefs?.setBool(key, value as bool);
//       break;
//     case const (List<String>):
//       await prefs?.setStringList(key, value as List<String>);
//       break;
//     default:
//       print("Unsupported type");
//       break;
//   }
// }

// T? getValue<T>({required String key}) {
//   final value = prefs?.get(key) as T;
//   final type = value.runtimeType;
//   print('value: $value, type: $type');
//   return value;
// }
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String name;
  final double height;
  final int age;

  User({
    required this.name,
    required this.height,
    required this.age,
  });
}

const userNicknameKey = 'user_nickname';
const userHeightKey = 'user_height';
const userAgeKey = 'user_age';
const userIsAndroidUserKey = 'user_is_android_user';

final sharedPreferencesProvider =
    StateNotifierProvider<SharedPreferencesController, User>((ref) {
  return SharedPreferencesController();
});

class SharedPreferencesController extends StateNotifier<User> {
  SharedPreferencesController()
      : super(
          User(
            name: '',
            height: 0.0,
            age: 0,
          ),
        ) {
    _loadUser();
  }

  Future<User> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final loadedUserNickname = prefs.getString(userNicknameKey);
    final loadedUserHeight = prefs.getDouble(userHeightKey);
    final loadedUserAge = prefs.getInt(userAgeKey);

    print('load user fired');
    state = User(
      name: loadedUserNickname ?? '',
      height: loadedUserHeight ?? 0.0,
      age: loadedUserAge ?? 0,
    );
    return User(
      name: loadedUserNickname ?? '',
      height: loadedUserHeight ?? 0.0,
      age: loadedUserAge ?? 0,
    );
  }

  Future<void> setValue({required String key, required Object value}) async {
    final prefs = await SharedPreferences.getInstance();
    final valueType = value.runtimeType;
    switch (valueType) {
      case String:
        await prefs.setString(key, value as String);
        break;
      case int:
        await prefs.setInt(key, value as int);
        break;
      case double:
        await prefs.setDouble(key, value as double);
        break;
      case bool:
        await prefs.setBool(key, value as bool);
        break;
      case const (List<String>):
        await prefs.setStringList(key, value as List<String>);
        break;
      default:
        print("Unsupported type");
        break;
    }
  }

  Future<T?> getValue<T>({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get(key) as T;
    final type = value.runtimeType;
    print('value: $value, type: $type');
    return value;
  }
}
