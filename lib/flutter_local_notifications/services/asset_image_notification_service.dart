import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sample_flutter/flutter_local_notifications/const/notification_constants.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sample_flutter/flutter_local_notifications/screens/asset_image_screen.dart';

class AssetImageNotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // 1. navigatorKey を受け取る
  static Future<void> initialize(GlobalKey<NavigatorState> navigatorKey) async {
    // Android 初期設定
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS 初期設定
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    // 全体の初期設定
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        _onDidReceiveNotificationResponse(response, navigatorKey);
      },
      onDidReceiveBackgroundNotificationResponse:
          _onDidReceiveBackgroundNotificationResponse,
    );

    if (Platform.isIOS) {
      await _requestIOSPermissions();
    } else if (Platform.isAndroid) {
      await _requestAndroidPermissions();
    } else {
      debugPrint('通知権限のリクエストはサポートされていません');
    }
  }

  // iOS 通知権限のリクエスト
  static Future<void> _requestIOSPermissions() async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  // Android 通知権限のリクエスト
  static Future<void> _requestAndroidPermissions() async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  // 2. 通知のタップ時の処理
  static Future<void> _onDidReceiveNotificationResponse(
      NotificationResponse response,
      GlobalKey<NavigatorState> navigatorKey) async {
    final payload = response.payload;

    if (payload != null && payload.startsWith('image_asset_path=')) {
      debugPrint('payload: $payload');
      final imagePath = payload.replaceFirst('image_asset_path=', '');
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => AssetImageScreen(imageAssetPath: imagePath),
        ),
      );
    }
    debugPrint('onDidReceiveNotificationResponse: $response');
  }

  // バックグラウンドで通知を受け取った時の処理
  static Future<void> _onDidReceiveBackgroundNotificationResponse(
      NotificationResponse notificationResponse) async {
    debugPrint(
        'onDidReceiveBackgroundNotificationResponse: $notificationResponse');
  }

  // 3. アセット画像をコピーして保存する関数
  static Future<String?> _copyAssetImageToFile(
    String assetPath,
    String fileName,
  ) async {
    try {
      final ByteData byteData = await rootBundle.load(assetPath);
      final Uint8List bytes = byteData.buffer.asUint8List();

      final Directory directory = await getTemporaryDirectory();
      final String filePath = '${directory.path}/$fileName';
      final File file = File(filePath);
      await file.writeAsBytes(bytes);
      return filePath;
    } catch (e, stack) {
      debugPrint('アセット画像のコピー中にエラーが発生しました: $e');
      debugPrint('スタックトレース: $stack');
      return null;
    }
  }

  // 4.通知の送信
  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
    required String imageAssetPath, // アセット画像パスを指定
  }) async {
    String? finalPayload = payload;

    // Android 用のスタイル情報
    AndroidNotificationDetails androidNotificationDetails;
    // iOS 用のスタイル情報
    DarwinNotificationDetails? iosNotificationDetails;

    // アセット画像をコピー
    final String? assetImagePath =
        await _copyAssetImageToFile(imageAssetPath, 'asset_image.png');

    if (assetImagePath != null) {
      androidNotificationDetails = AndroidNotificationDetails(
        NotificationConstants.channelId,
        NotificationConstants.channelName,
        channelDescription: NotificationConstants.channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: BigPictureStyleInformation(
          FilePathAndroidBitmap(assetImagePath),
          contentTitle: title,
          summaryText: body,
        ),
      );

      iosNotificationDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        attachments: [
          DarwinNotificationAttachment(
            assetImagePath,
            hideThumbnail: false,
          ),
        ],
      );

      // ペイロードにアセット画像パスを含める
      finalPayload = 'image_asset_path=$imageAssetPath';
    } else {
      androidNotificationDetails = const AndroidNotificationDetails(
        NotificationConstants.channelId,
        NotificationConstants.channelName,
        channelDescription: NotificationConstants.channelDescription,
        importance: Importance.max,
        priority: Priority.high,
      );
      iosNotificationDetails = const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );
    }

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: finalPayload,
    );
  }
}
