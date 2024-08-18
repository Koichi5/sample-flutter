import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_manager.g.dart';

enum FeedbackType {
  impact,
  selection,
  notification,
}

@riverpod
class FeedbackManager extends _$FeedbackManager {
  @override
  FeedbackType build() {
    return FeedbackType.impact;
  }

  Future<void> triggerImpactFeedback({
    ImpactFeedbackStyle style = ImpactFeedbackStyle.medium,
  }) async {
    state = FeedbackType.impact;
    switch (style) {
      case ImpactFeedbackStyle.light:
        await HapticFeedback.lightImpact();
        break;
      case ImpactFeedbackStyle.medium:
        await HapticFeedback.mediumImpact();
        break;
      case ImpactFeedbackStyle.heavy:
        await HapticFeedback.heavyImpact();
        break;
    }
  }

  Future<void> triggerSelectionFeedback() async {
    state = FeedbackType.selection;
    await HapticFeedback.selectionClick();
  }

  Future<void> triggerNotificationFeedback({
    NotificationFeedbackType type = NotificationFeedbackType.success,
  }) async {
    state = FeedbackType.notification;
    switch (type) {
      case NotificationFeedbackType.success:
        await HapticFeedback.mediumImpact();
        await Future.delayed(const Duration(milliseconds: 200));
        await HapticFeedback.heavyImpact();
        break;
      case NotificationFeedbackType.warning:
        await HapticFeedback.heavyImpact();
        await Future.delayed(const Duration(milliseconds: 300));
        await HapticFeedback.mediumImpact();
        break;
      case NotificationFeedbackType.error:
        await HapticFeedback.mediumImpact();
        await Future.delayed(const Duration(milliseconds: 100));
        await HapticFeedback.mediumImpact();
        await Future.delayed(const Duration(milliseconds: 100));
        await HapticFeedback.heavyImpact();
        await Future.delayed(const Duration(milliseconds: 100));
        await HapticFeedback.heavyImpact();
        break;
    }
  }
}

enum ImpactFeedbackStyle {
  light,
  medium,
  heavy,
}

enum NotificationFeedbackType {
  success,
  warning,
  error,
}
