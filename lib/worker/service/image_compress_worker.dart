// image_compression_worker.dart
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

DedicatedWorkerGlobalScope get self => DedicatedWorkerGlobalScope.instance;

void main() {
  self.postMessage({'log': 'Worker started'});

  self.onMessage.listen((event) {
    try {
      self.postMessage({'log': 'Received message in worker'});
      final data = event.data;
      if (data['action'] == 'compress') {
        self.postMessage({'log': 'Compress action received'});
        final buffer = data['imageData'] as ByteBuffer;
        final imageData = Uint8List.view(buffer);
        self.postMessage(
          {'log': 'Image data received, length: ${imageData.length}'},
        );
        final compressedImage = compressImage(imageData);
        self
          ..postMessage(
            {'log': 'Image compressed, new length: ${compressedImage.length}'},
          )
          ..postMessage(
            {'compressedImage': compressedImage},
            [compressedImage.buffer],
          );
      } else {
        throw Exception('Unknown action: ${data['action']}');
      }
    } on Exception catch (e, stackTrace) {
      self.postMessage({
        'error': 'Error in worker: $e',
        'stackTrace': stackTrace.toString(),
      });
    }
  });
}

Uint8List compressImage(Uint8List input) {
  self.postMessage({'log': 'Starting image compression'});
  final image = img.decodeImage(input);
  if (image == null) {
    throw Exception('Failed to decode image');
  }
  self.postMessage({'log': 'Image decoded successfully'});
  final resized = img.copyResize(image, width: 800);
  self.postMessage({'log': 'Image resized'});
  final compressed = img.encodeJpg(resized, quality: 85);
  self.postMessage({'log': 'Image encoded as JPG'});
  return Uint8List.fromList(compressed);
}