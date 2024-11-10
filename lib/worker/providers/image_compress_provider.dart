import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_flutter/worker/service/image_compress_service.dart';

part 'image_compress_provider.g.dart';

@riverpod
Future<Uint8List> imageCompress(
  Ref ref,
  Uint8List file,
) async {
  try {
    final worker = ImageCompressionWorker();
    return await worker.compressImage(file);
  } on Exception catch (e) {
    debugPrint('Image compression error: $e');
    rethrow;
  }
}