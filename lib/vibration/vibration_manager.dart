import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibration/vibration.dart';

part 'vibration_manager.g.dart';

@riverpod
class VibrationManager extends _$VibrationManager {
  bool _hasVibrator = false;
  bool _hasCustomVibrationsSupport = false;

  @override
  Future<void> build() async {
    _hasVibrator = await Vibration.hasVibrator() ?? false;
    _hasCustomVibrationsSupport =
        await Vibration.hasCustomVibrationsSupport() ?? false;
  }

  Future<void> triggerCustomFeedback({
    CustomFeedbackType type = CustomFeedbackType.long,
  }) async {
    if (!_hasVibrator || !_hasCustomVibrationsSupport) return;

    switch (type) {
      case CustomFeedbackType.long:
        Vibration.vibrate(
          pattern: [0, 1000],
          intensities: [0, 255],
        );
        break;
      case CustomFeedbackType.threeTimes:
        Vibration.vibrate(
          pattern: [0, 500, 500, 500, 500, 500],
          intensities: [0, 255, 0, 255, 0, 255],
        );
        break;
    }
  }
}

enum CustomFeedbackType {
  long,
  threeTimes,
}
