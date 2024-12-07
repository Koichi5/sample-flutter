import 'package:flutter/material.dart';
import 'package:sample_flutter/restoration/my_home_page_with_restoration.dart';
import 'package:sample_flutter/restoration/restorable_value_screen.dart';
import 'package:sample_flutter/restoration/scroll_page_with_restoration.dart';
import 'package:sample_flutter/restoration/scroll_page_without_restoration.dart';

void main() {
  runApp(
    const RestorationScope(
      restorationId: 'app',
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
      title: 'State Restoration Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotRestorableValueExample(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Restoration Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('With RestorationMixin'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePageWithScrollRestoration(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Without RestorationMixin'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePageWithoutScrollRestoration(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
