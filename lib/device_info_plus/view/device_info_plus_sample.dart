import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_flutter/device_info_plus/provider/device_info_plus_provider.dart';

class DeviceInfoPlusSample extends ConsumerWidget {
  const DeviceInfoPlusSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('デバイス情報'),
      ),
      body: FutureBuilder(
        future: ref
            .read(deviceInfoPlusControllerProvider.notifier)
            .initPlatformState(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.data as Map<String, dynamic>;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              String key = data.keys.elementAt(index);
              return ListTile(
                title: Text(key),
                subtitle: Text(data[key].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
