import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:sample_flutter/vibration/feedback_manager.dart';
import 'package:sample_flutter/vibration/vibration_manager.dart';

class FeedbackListSample extends ConsumerWidget {
  const FeedbackListSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedBackController = ref.read(feedbackManagerProvider.notifier);
    final vibrationController = ref.read(vibrationManagerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'バイブレーション',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Impact Feedback',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(16),
              ...ImpactFeedbackStyle.values.map(
                (style) => ListTile(
                  title: Text(style.name),
                  onTap: () {
                    feedBackController.triggerImpactFeedback(
                      style: style,
                    );
                  },
                ),
              ),
              const Gap(32),
              Text(
                'Selection Feedback',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(16),
              ListTile(
                title: const Text('Selection Feedback'),
                onTap: () {
                  feedBackController.triggerSelectionFeedback();
                },
              ),
              const Gap(32),
              Text(
                'Notification Feedback',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(16),
              ...NotificationFeedbackType.values.map(
                (type) => ListTile(
                  title: Text(type.name),
                  onTap: () {
                    feedBackController.triggerNotificationFeedback(type: type);
                  },
                ),
              ),
              const Gap(32),
              Text(
                'Custom Feedback',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(16),
              ...CustomFeedbackType.values.map(
                (type) => ListTile(
                  title: Text(type.name),
                  onTap: () {
                    vibrationController.triggerCustomFeedback(type: type);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
