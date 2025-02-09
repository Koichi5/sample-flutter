import 'package:flutter/material.dart';
import 'package:sample_flutter/signals/common/month.dart';
import 'package:signals/signals_flutter.dart';

// 一つ前の値を保持する Signal を作成
class TrackedMonthSignal extends Signal<Month> with TrackedSignalMixin<Month> {
  TrackedMonthSignal(super.initialValue);
}

class TrackedSignalMixinSample extends StatefulWidget {
  const TrackedSignalMixinSample({super.key});

  @override
  State<TrackedSignalMixinSample> createState() =>
      _TrackedSignalMixinSampleState();
}

class _TrackedSignalMixinSampleState extends State<TrackedSignalMixinSample> {
  late final selectedMonth = TrackedMonthSignal(Month.january);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracked Signal Mixin Sample'),
      ),
      body: Center(
        child: Column(
          children: [
            Watch(
              (context) => Text(
                selectedMonth.value.name,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 16),
            Watch(
              (context) => SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: DropdownButtonFormField<Month>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: selectedMonth.value,
                  items: Month.values
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.name)))
                      .toList(),
                  onChanged: (month) {
                    if (month == null) return;
                    selectedMonth.value = month;
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    if (selectedMonth.previousValue == null) return;
                    selectedMonth.value = selectedMonth.previousValue!;
                  },
                  child: const Text('Undo'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// 複雑な処理が不要であれば、独自の Mixin を作成せずに trackedSignal で一つ前の値を保持できる
class TrackedSignalSample extends StatelessWidget {
  const TrackedSignalSample({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMonth = trackedSignal(Month.january);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracked Signal Sample'),
      ),
      body: Center(
        child: Column(
          children: [
            Watch(
              (context) => Text(
                selectedMonth.value.name,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 16),
            Watch(
              (context) => SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: DropdownButtonFormField<Month>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: selectedMonth.value,
                  items: Month.values
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.name)))
                      .toList(),
                  onChanged: (month) {
                    if (month == null) return;
                    selectedMonth.value = month;
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    if (selectedMonth.previousValue == null) return;
                    selectedMonth.value = selectedMonth.previousValue!;
                  },
                  child: const Text('Undo'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
