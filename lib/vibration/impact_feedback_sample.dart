import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_flutter/vibration/feedback_manager.dart';

class ImpactFeedbackSample extends HookConsumerWidget {
  const ImpactFeedbackSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNotificationToggleOn = useState(false);
    final isVibrationToggleOn = useState(false);
    final feedbackController = ref.read(feedbackManagerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impact Feedback Sample'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SwitchListTile(
          title: const Text('通知'),
          value: isNotificationToggleOn.value,
          onChanged: (value) {
            isNotificationToggleOn.value = value;
            feedbackController.triggerImpactFeedback();
          },
          secondary: const Icon(Icons.notifications),
        ),
          SwitchListTile(
            title: const Text('バイブレーション'),
            value: isVibrationToggleOn.value,
            onChanged: (value) {
              isVibrationToggleOn.value = value;
              feedbackController.triggerImpactFeedback();
            },
            secondary: const Icon(Icons.vibration),
          ),
        ],
      ),
    );
  }
}
