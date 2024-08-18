import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_flutter/vibration/feedback_manager.dart';

class SelectionFeedbackSample extends HookConsumerWidget {
  const SelectionFeedbackSample({super.key});

  static const _items = [
    "item 1",
    "item 2",
    "item 3",
    "item 4",
    "item 5",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackController = ref.read(feedbackManagerProvider.notifier);
    final currentIndex = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Feedback Sample'),
      ),
      body: Center(
        child: TextButton(
          child: const Text(
            'アイテムを選択',
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: CupertinoPicker(
                    itemExtent: 40,
                    onSelectedItemChanged: (int index) {
                      currentIndex.value = index;
                      feedbackController.triggerSelectionFeedback();
                    },
                    children: _items.map((item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item),
                    )).toList(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
