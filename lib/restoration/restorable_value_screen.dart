import 'package:flutter/material.dart';

class RestorableValueExample extends StatefulWidget {
  const RestorableValueExample({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<RestorableValueExample> createState() => _RestorableValueExampleState();
}

class _RestorableValueExampleState extends State<RestorableValueExample>
    with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableInt _answer = RestorableInt(42);

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_answer, 'answer');
  }

  void _incrementAnswer() {
    setState(() {
      _answer.value += 1;
    });
  }

  @override
  void dispose() {
    _answer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: _incrementAnswer,
          child: Text('${_answer.value}'),
        ),
      ),
    );
  }
}



class NotRestorableValueExample extends StatefulWidget {
  const NotRestorableValueExample({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<NotRestorableValueExample> createState() => _NotRestorableValueExampleState();
}

class _NotRestorableValueExampleState extends State<NotRestorableValueExample> {

  var _answer = 42;

  void _incrementAnswer() {
    setState(() {
      _answer += 1;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: _incrementAnswer,
          child: Text('$_answer'),
        ),
      ),
    );
  }
}
