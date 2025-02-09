import 'package:flutter/material.dart';
import 'package:sample_flutter/signals/common/month.dart';
import 'package:signals/signals_flutter.dart';

// 変更履歴を保持する Signal を作成
class ChangeStackMonthSignal extends Signal<Month> with ChangeStackSignalMixin<Month> {
  ChangeStackMonthSignal(super.initialValue);
}

class ChangeStackSignalMixinSample extends StatefulWidget {
  const ChangeStackSignalMixinSample({super.key});

  @override
  State<ChangeStackSignalMixinSample> createState() =>
      _ChangeStackSignalMixinSampleState();
}

class _ChangeStackSignalMixinSampleState
    extends State<ChangeStackSignalMixinSample> {
  @override
  Widget build(BuildContext context) {
    final selectedMonth = ChangeStackMonthSignal(Month.january);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Stack Signal Mixin Sample'),
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
                    onPressed: () => selectedMonth.undo(),
                    child: const Text('Undo')),
                TextButton(
                    onPressed: () => selectedMonth.redo(),
                    child: const Text('Redo')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChangeStackSignalSample extends StatelessWidget {
  const ChangeStackSignalSample({super.key});

  @override
  Widget build(BuildContext context) {
    // 複雑な処理が不要であれば、独自の Mixin を作成せずに changeStack で履歴を保持できる
    final selectedMonth = changeStack(Month.january);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Stack Signal Sample'),
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
                    onPressed: () => selectedMonth.undo(),
                    child: const Text('Undo')),
                TextButton(
                    onPressed: () => selectedMonth.redo(),
                    child: const Text('Redo')),
              ],
            )
          ],
        ),
      ),
    );
  }
}