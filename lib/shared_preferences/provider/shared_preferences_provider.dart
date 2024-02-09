import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_provider.g.dart';

@riverpod
class SharedPreferencesController extends _$SharedPreferencesController {
  static SharedPreferences? prefs;

  @override
  Future<void> build() async {
    print('shared preferences provider build fired');
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setValue({required String key, required Object value}) async {
    final valueType = value.runtimeType;
    switch (valueType) {
      case String:
        await prefs?.setString(key, value as String);
        break;
      case int:
        await prefs?.setInt(key, value as int);
        break;
      case double:
        await prefs?.setDouble(key, value as double);
        break;
      case bool:
        await prefs?.setBool(key, value as bool);
        break;
      case const (List<String>):
        await prefs?.setStringList(key, value as List<String>);
        break;
      default:
        print("Unsupported type");
        break;
    }
  }

  T? getValue<T>({required String key}) {
    final value = prefs?.get(key) as T;
    final type = value.runtimeType;
    print('value: $value, type: $type');
    return value;
  }
}
