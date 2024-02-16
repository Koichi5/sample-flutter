import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sample_flutter/gemini/views/gemini_sample.dart';

Future main() async {
  await dotenv.load(fileName: ".env").then((value) async {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      log('No \$API_KEY environment variable');
      exit(1);
    } else {
      log(apiKey);
    }

    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final content = [Content.text('Write a story about a magic backpack')];
    final response = await model.generateContent(content);
    print(response.text);
  });

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
      home: GeminiSample(),
    );
  }
}
