import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/signals/counter_sample/signals_counter_sample.dart';
import 'package:sample_flutter/signals/form/hooks_form.dart';
import 'package:sample_flutter/signals/reactive_shape_maker.dart/signals_reactive_shape_maker.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lato',
        fontFamilyFallback: const ['NotoSans'],
      ),
      // home: SignalsCounterSample(),
      home: const HooksForm(
        initialName: 'John Doe',
        initialEmail: 'john.doe@example.com',
      ),
    );
  }
}
