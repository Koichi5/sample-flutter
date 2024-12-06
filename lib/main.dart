import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/flutter_local_notifications/services/asset_image_notification_service.dart';
import 'package:sample_flutter/flutter_local_notifications/services/network_image_notiifcation_service.dart';
import 'package:sample_flutter/flutter_local_notifications/services/on_tap_notification_service.dart';
import 'package:sample_flutter/flutter_local_notifications/services/simple_notification_service.dart';
import 'package:sample_flutter/flutter_local_notifications/screens/notification_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 通知サービスの初期化
  await SimpleNotificationService.initialize();
  await OnTapNotificationService.initialize();
  await AssetImageNotificationService.initialize(navigatorKey);
  await NetworkImageNotificationService.initialize(navigatorKey);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lato',
        fontFamilyFallback: const ['NotoSans'],
      ),
      home: const NotificationScreen(),
    );
  }
}
