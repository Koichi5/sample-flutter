import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_flutter/qr/models/book.dart';

part 'mobile_scanner_provider.g.dart';

@riverpod
class MobileScannerBarcodeController extends _$MobileScannerBarcodeController {
  @override
  String? build() {
    return '';
  }

  String setCode({required List<Barcode> barcodes}) {
    for (final barcode in barcodes) {
      state = barcode.rawValue;
    }
    return state ?? '';
  }
}

@riverpod
class MobileScannerBookController extends _$MobileScannerBookController {
  @override
  Book build() {
    return const Book(kind: '', totalItems: 0, items: []);
  }

  Future<Book> fetchBook({required String barcode}) async {
    log('fetch book fired, book barcode is: $barcode');
    final url = 'https://www.googleapis.com/books/v1/volumes?q=isbn:$barcode';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      log('book: ${Book.fromJson(json)}');
      return Book.fromJson(json);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
