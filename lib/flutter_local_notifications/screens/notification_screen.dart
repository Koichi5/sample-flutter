import 'package:flutter/material.dart';
import 'package:sample_flutter/flutter_local_notifications/services/asset_image_notification_service.dart';
import 'package:sample_flutter/flutter_local_notifications/services/network_image_notiifcation_service.dart';
import 'package:sample_flutter/flutter_local_notifications/services/on_tap_notification_service.dart';
import 'package:sample_flutter/flutter_local_notifications/services/simple_notification_service.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SimpleNotificationService.showNotification(
                  id: 0,
                  title: 'Hello World !',
                  body: 'Happy Coding! 🚀',
                );
              },
              child: const Text('シンプルな通知'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                OnTapNotificationService.showNotification(
                  id: 0,
                  title: 'Hello World !',
                  body: 'Happy Coding! 🚀',
                );
              },
              child: const Text('タップした時の処理をカスタマイズ'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                AssetImageNotificationService.showNotification(
                  id: 0,
                  title: 'アセット画像を表示',
                  body: 'Asset に含まれている画像を表示します',
                  imageAssetPath: 'assets/images/vegetable.png',
                );
              },
              child: const Text('アセット画像を表示'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                NetworkImageNotificationService.showNotification(
                  id: 0,
                  title: 'ネットワーク画像を表示',
                  body: 'ネットワーク上の画像を表示します',
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2015/12/16/17/41/bell-1096280_1280.png',
                );
              },
              child: const Text('ネットワーク画像を表示'),
            ),
          ],
        ),
      ),
    );
  }
}
