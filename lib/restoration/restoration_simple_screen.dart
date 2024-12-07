import 'package:flutter/material.dart';

class RestorationSimpleScreen extends StatefulWidget {
  const RestorationSimpleScreen({super.key});

  @override
  State<RestorationSimpleScreen> createState() =>
      _RestorationSimpleScreenState();
}

class _RestorationSimpleScreenState extends State<RestorationSimpleScreen>
    with RestorationMixin<RestorationSimpleScreen> {
  final RestorableInt _counter = RestorableInt(0);

  void _incrementCounter() {
    setState(() {
      _counter.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Restorable Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  String? get restorationId => 'counter_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }
}



