import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/cancel/data_sources/remote_photo_data_source.dart';
import 'package:sample_flutter/cancel/repositories/photo_repository_impl.dart';
import 'package:sample_flutter/cancel/screens/photo_completer_screen.dart';
import 'package:sample_flutter/cancel/services/photo_completer_service.dart';
import 'package:http/http.dart' as http;

void main() {
  debugProfileBuildsEnabled = true;
  debugProfileBuildsEnabledUserWidgets = true;
  debugProfileLayoutsEnabled = true;
  debugProfilePaintsEnabled = true;
  final client = http.Client();
  final remoteDataSource = RemotePhotoDataSource(client: client);
  final photoRepository =
      PhotoRepositoryImpl(remoteDataSource: remoteDataSource);
  final photoService = PhotoCompleterService(photoRepository: photoRepository);
  runApp(
    ProviderScope(
      child: MyApp(
        photoService: photoService,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.photoService,
  });
  final PhotoCompleterService photoService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lato',
        fontFamilyFallback: const ['NotoSans'],
      ),
      home: PhotoCompleterScreen(photoService: photoService)
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayMedium,
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
}

class WidgetCache<T> extends StatefulWidget {
  const WidgetCache({super.key, required this.value, required this.builder});

  final T value;
  final Widget Function(BuildContext context, T value) builder;

  @override
  WidgetCacheState<T> createState() => WidgetCacheState<T>();
}

class WidgetCacheState<T> extends State<WidgetCache<T>> {
  late Widget cache;
  T? previousValue;

  @override
  Widget build(BuildContext context) {
    if (identical(widget.value, previousValue) == false) {
      previousValue = widget.value;
      cache = Builder(
        builder: (context) => widget.builder(context, widget.value),
      );
    }
    return cache;
  }
}
