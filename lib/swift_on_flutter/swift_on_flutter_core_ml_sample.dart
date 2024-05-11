import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SwiftOnFlutterCoreMlSample extends HookWidget {
  const SwiftOnFlutterCoreMlSample({super.key});

  final MethodChannel _methodChannel = const MethodChannel('com.example.flutter');

  @override
  Widget build(BuildContext context) {
    final result = useState('分析結果を表示します...');
    final imageUrlController = useTextEditingController(
      text:
          'https://cdn.pixabay.com/photo/2017/11/02/00/34/parrot-2909828_1280.jpg',
    );

    Future getTextLabelFromImage({required String imageUrl}) async {
      final arguments = {'imageUrl': imageUrl};
      try {
        var response = await _methodChannel.invokeMethod(
            'getTextLabelFromImage', arguments);
        result.value = response;
      } on PlatformException catch (e) {
        log(e.message ?? 'Unexpected PlatformException');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CoreML on Flutter'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: imageUrlController,
                    onSubmitted: (value) {
                      imageUrlController.text = value;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    getTextLabelFromImage(imageUrl: imageUrlController.text);
                  },
                  child: const Text('分析'),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.6,
              fit: BoxFit.cover,
              imageUrlController.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(result.value),
          ),
        ],
      ),
    );
  }
}
