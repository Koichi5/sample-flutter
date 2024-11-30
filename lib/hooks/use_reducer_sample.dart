import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@immutable
class CounterState {
  const CounterState({this.count = 0});
  final int count;

  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }
}

sealed class CounterAction {}

class CounterIncrementAction implements CounterAction {
  const CounterIncrementAction();
}

class CounterDecrementAction implements CounterAction {
  const CounterDecrementAction();
}

class CounterResetAction implements CounterAction {
  const CounterResetAction();
}

typedef CounterStore = Store<CounterState, CounterAction>;
typedef CounterReducer = Reducer<CounterState, CounterAction>;
CounterReducer get reducer => (state, action) {
      return switch (action) {
        CounterIncrementAction() => state.copyWith(count: state.count + 1),
        CounterDecrementAction() => state.copyWith(count: state.count - 1),
        CounterResetAction() => state.copyWith(count: 0),
      };
    };

class UseReducerSample extends HookWidget {
  const UseReducerSample({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterStore store = useReducer(
      reducer,
      initialState: const CounterState(),
      initialAction: const CounterResetAction(),
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${store.state.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.red,
                  onPressed: () =>
                      store.dispatch(const CounterIncrementAction()),
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  color: Colors.blue,
                  onPressed: () =>
                      store.dispatch(const CounterDecrementAction()),
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
