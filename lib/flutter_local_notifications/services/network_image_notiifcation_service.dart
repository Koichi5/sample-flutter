import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sample_flutter/flutter_local_notifications/const/notification_constants.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:sample_flutter/flutter_local_notifications/screens/network_image_screen.dart';

class NetworkImageNotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // 通知サービスの初期化
  static Future<void> initialize(GlobalKey<NavigatorState> navigatorKey) async {
    // Android 初期設定
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS 初期設定
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
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

  // 通知のタップ時の処理
  static void _onDidReceiveNotificationResponse(
      NotificationResponse response, GlobalKey<NavigatorState> navigatorKey) {
    final payload = response.payload;

    if (payload != null && payload.startsWith('image_url=')) {
      final imageUrl = payload.replaceFirst('image_url=', '');
      // 画像表示画面へ遷移
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => NetworkImageScreen(imageUrl: imageUrl),
        ),
      );
    }

    debugPrint('Notification Tapped with payload: $payload');
  }

  // バックグラウンドで通知を受け取った時の処理
  static Future _onDidReceiveBackgroundNotificationResponse(
      NotificationResponse response) async {
    debugPrint('onDidReceiveBackgroundNotificationResponse: $response');
  }

  // 画像をダウンロードして保存する関数
  static Future<String?> _downloadAndSaveImage(
      String url, String fileName) async {
    try {
      final Uri uri = Uri.parse(url);
      final http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        String extension = 'jpg'; // デフォルトの拡張子
        final contentType = response.headers['content-type'];
        if (contentType != null) {
          if (contentType.contains('jpeg')) {
            extension = 'jpg';
          } else if (contentType.contains('png')) {
            extension = 'png';
          } else if (contentType.contains('gif')) {
            extension = 'gif';
          }
        } else {
          // URLから拡張子を取得（存在する場合）
          final uriPath = uri.path;
          final uriExtension = uriPath.split('.').last;
          if (uriExtension == 'png' ||
              uriExtension == 'jpg' ||
              uriExtension == 'jpeg' ||
              uriExtension == 'gif') {
            extension = uriExtension;
          }
        }

        final Directory directory = await getTemporaryDirectory();
        final String filePath = '${directory.path}/$fileName.$extension';
        final File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return filePath;
      } else {
        debugPrint('画像のダウンロードに失敗しました。ステータスコード: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('画像のダウンロード中にエラーが発生しました: $e');
      return null;
    }
  }

  // 通知の送信
  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String imageUrl, // ネットワーク画像URLを指定
    String? payload,
  }) async {
    String? finalPayload = payload;

    // Android 用のスタイル情報
    AndroidNotificationDetails androidNotificationDetails;
    // iOS 用のスタイル情報
    DarwinNotificationDetails? iosNotificationDetails;

    // ネットワーク画像をダウンロード
    final String? downloadedImagePath =
        await _downloadAndSaveImage(imageUrl, 'downloaded_image');

    if (downloadedImagePath != null) {
      androidNotificationDetails = AndroidNotificationDetails(
        NotificationConstants.channelId,
        NotificationConstants.channelName,
        channelDescription: NotificationConstants.channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: BigPictureStyleInformation(
          FilePathAndroidBitmap(downloadedImagePath),
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
            downloadedImagePath,
            hideThumbnail: false,
          ),
        ],
      );

      // ペイロードに画像URLを含める
      finalPayload = 'image_url=$imageUrl';
    } else {
      // 画像のダウンロードに失敗した場合はシンプルな通知
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
