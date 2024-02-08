import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/flutter_secure_storage/provider/flutter_secure_storage_provider.dart';

class FlutterSecureStorageSample extends ConsumerWidget {
  const FlutterSecureStorageSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nicknameController = TextEditingController();
    final passwordController = TextEditingController();
    const userNicknameKey = 'user_nickname';
    const userPasswordKey = 'user_password';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.92,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('データ'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FutureBuilder<Map<String, String>>(
                  future: ref
                      .watch(flutterSecureStorageControllerProvider.notifier)
                      .getAllValue(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('データがありません');
                    }
                    final data = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        String key = data.keys.elementAt(index);
                        dynamic value = data[key];
                        return ListTile(
                          title: Text(key),
                          subtitle: Text(
                            value.toString(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'ニックネーム',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 0.5,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  controller: nicknameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'パスワード',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 0.5,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  controller: passwordController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await ref
                            .read(
                                flutterSecureStorageControllerProvider.notifier)
                            .setValue(
                              key: userNicknameKey,
                              value: nicknameController.text,
                            );
                      },
                      child: const Text(
                        'ニックネームを保存',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await ref
                            .read(
                                flutterSecureStorageControllerProvider.notifier)
                            .setValue(
                              key: userPasswordKey,
                              value: passwordController.text,
                            );
                      },
                      child: const Text(
                        'パスワードを保存',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await ref
                            .read(
                                flutterSecureStorageControllerProvider.notifier)
                            .deleteValue(key: userNicknameKey);
                      },
                      child: const Text(
                        'ニックネームを削除',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await ref
                            .read(
                                flutterSecureStorageControllerProvider.notifier)
                            .deleteValue(key: userPasswordKey);
                      },
                      child: const Text(
                        'パスワードを削除',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(flutterSecureStorageControllerProvider.notifier)
                        .deleteAllValue();
                  },
                  child: const Text(
                    '全データを削除',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
