import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flutter_secure_storage_provider.g.dart';

@riverpod
class FlutterSecureStorageController extends _$FlutterSecureStorageController {
  late final FlutterSecureStorage storage;

  @override
  void build() {
    storage = const FlutterSecureStorage();
  }

  Future<void> setValue({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> getValue({required String key}) async {
    return await storage.read(key: key);
  }

  Future<Map<String, String>> getAllValue() async {
    return await storage.readAll();
  }

  Future<void> deleteValue({required String key}) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAllValue() async {
    await storage.deleteAll();
  }
}
