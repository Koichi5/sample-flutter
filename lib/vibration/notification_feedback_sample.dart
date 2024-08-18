import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_flutter/vibration/feedback_manager.dart';

class NotificationFeedbackSample extends HookConsumerWidget {
  const NotificationFeedbackSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackController = ref.read(feedbackManagerProvider.notifier);
    final sendStatus = useState(SendStatus.notSent);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Feedback Sample'),
      ),
      body: Center(
        child: TextButton.icon(
          icon: sendStatus.value.icon,
          label: Text(
            sendStatus.value.label,
            style: const TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            backgroundColor: sendStatus.value.backgroundColor,
          ),
          onPressed: () {
            final random = Random();
            final nextStatus = [
              SendStatus.success,
              SendStatus.warning,
              SendStatus.error,
            ][random.nextInt(3)];

            sendStatus.value = nextStatus;

            switch (nextStatus) {
              case SendStatus.success:
                feedbackController.triggerNotificationFeedback(
                    type: NotificationFeedbackType.success);
                break;
              case SendStatus.warning:
                feedbackController.triggerNotificationFeedback(
                    type: NotificationFeedbackType.warning);
                break;
              case SendStatus.error:
                feedbackController.triggerNotificationFeedback(
                    type: NotificationFeedbackType.error);
                break;
              default:
                break;
            }
          },
        ),
      ),
    );
  }
}

enum SendStatus {
  notSent(
    label: '送信する',
    icon: Icon(
      Icons.send,
      color: Colors.white,
    ),
    backgroundColor: Colors.blue,
  ),
  success(
    label: '送信済み',
    icon: Icon(
      Icons.check,
      color: Colors.white,
    ),
    backgroundColor: Colors.green,
  ),
  warning(
    label: '画像が送信されていません',
    icon: Icon(
      Icons.warning,
      color: Colors.white,
    ),
    backgroundColor: Colors.orange,
  ),
  error(
    label: '送信できませんでした',
    icon: Icon(
      Icons.close,
      color: Colors.white,
    ),
    backgroundColor: Colors.red,
  );

  const SendStatus({
    required this.label,
    required this.icon,
    required this.backgroundColor,
  });

  final String label;
  final Icon icon;
  final Color backgroundColor;
}
