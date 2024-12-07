// import 'dart:async';

// import 'package:sample_flutter/macros/macros/auto_dispose.dart';

// @AutoDispose()
// class DataService implements Disposable {
//   final StreamController<String> _controller = StreamController<String>();
//   late final StreamSubscription<String> _subscription;

//   DataService() {
//     _subscription = _controller.stream.listen((event) {
//       print(event);
//     });
//   }

//   void addData(String data) {
//     _controller.add(data);
//   }
// }
