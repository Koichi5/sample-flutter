// image_compress_service.dart
import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/foundation.dart';

class ImageCompressionWorker {
  ImageCompressionWorker() {
    try {
      _worker = html.Worker('web/worker/image_compress_worker.dart.js');
      debugPrint('Web Worker created successfully');
    } on Exception catch (e) {
      debugPrint('Failed to create Web Worker: $e');
      rethrow;
    }

    _worker.onError.listen((event) {
      if (event is html.ErrorEvent) {
        debugPrint('Worker error: ${event.message}');
        if (event.error != null) {
          debugPrint('Error details: ${event.error}');
        }
        if (event.filename != null) {
          debugPrint(
            'Error in file: ${event.filename}, line: ${event.lineno}, column: ${event.colno}',
          );
        }
      } else {
        debugPrint('Unknown worker error occurred: $event');
      }
    });
  }
  late html.Worker _worker;

  Future<Uint8List> compressImage(Uint8List imageData) {
    final completer = Completer<Uint8List>();

    void onMessage(html.Event event) {
      if (event is html.MessageEvent) {
        if (event.data['log'] != null) {
          debugPrint('Worker log: ${event.data['log']}');
        } else if (event.data['error'] != null) {
          debugPrint('Worker error: ${event.data['error']}');
          debugPrint('Stack trace: ${event.data['stackTrace']}');
          completer.completeError(Exception(event.data['error']));
        } else if (event.data['compressedImage'] != null) {
          final result =
              (event.data['compressedImage'] as List<dynamic>).cast<int>();
          completer.complete(Uint8List.fromList(result));
        } else {
          completer
              .completeError(Exception('Invalid message format from worker'));
        }
      }
    }

    _worker.addEventListener('message', onMessage);

    try {
      _worker.postMessage(
        {
          'action': 'compress',
          'imageData': imageData.buffer,
        },
        [imageData.buffer],
      );
    } on Exception catch (e) {
      debugPrint('Error posting message to worker: $e');
      completer.completeError(e);
    }

    Future.delayed(
      const Duration(seconds: 30),
      () {
        if (!completer.isCompleted) {
          completer.completeError(
            TimeoutException('Worker did not respond in time'),
          );
        }
      },
    );

    return completer.future;
  }
}
