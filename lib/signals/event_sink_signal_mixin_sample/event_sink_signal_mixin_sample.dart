import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class EventSinkSignalMixinSampleSignal extends Signal<AsyncState<int>> with EventSinkSignalMixin<int> {
  EventSinkSignalMixinSampleSignal(int value) : super(AsyncState.data(value));
}

class EventSinkSignalMixinSample extends StatelessWidget {
  const EventSinkSignalMixinSample({super.key});

  @override
  Widget build(BuildContext context) {
    final signal = EventSinkSignalMixinSampleSignal(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Sink Signal Mixin Sample'),
      ),
      body: Watch(
        (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (signal.value.hasValue) Text('Value: ${signal.value.value}'),
              if (signal.value.hasError) Text('Error: ${signal.value.error}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final currentValue = signal.value.value;
                  if (currentValue == null) return;
                  signal.add(currentValue + 1);
                },
                child: const Text('Add count'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  signal.addError('Custom Error');
                },
                child: const Text('Add error'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  signal.close();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
