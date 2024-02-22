import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sample_flutter/qr/providers/mobile_scanner_provider.dart';
import 'package:sample_flutter/qr/views/mobile_scanner_sample_detail.dart';

class MobileScannerQrcodeSample extends StatefulWidget {
  const MobileScannerQrcodeSample({super.key});

  @override
  State<MobileScannerQrcodeSample> createState() =>
      _MobileScannerQrcodeSampleState();
}

class _MobileScannerQrcodeSampleState extends State<MobileScannerQrcodeSample> {
  String barcode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile QR Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: MobileScanner(
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  final value = barcodes.first.rawValue;
                  if (value != null) {
                    setState(() {
                      barcode = value;
                    });
                    log('barcode value: $value');
                  } else {
                    setState(() {
                      barcode = 'コードが読み取れません';
                    });
                  }
                },
              ),
            ),
            Text(
              barcode,
            ),
          ],
        ),
      ),
    );
  }
}

class MobileScannerBarcodeSample extends ConsumerWidget {
  const MobileScannerBarcodeSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Barcode Scanner'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: MobileScanner(
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                ref
                    .watch(mobileScannerBarcodeControllerProvider.notifier)
                    .setCode(
                      barcodes: barcodes,
                    );
                log(
                  ref
                      .watch(mobileScannerBarcodeControllerProvider.notifier)
                      .setCode(
                        barcodes: barcodes,
                      ),
                );
              },
            ),
          ),
          Text(
            ref.watch(mobileScannerBarcodeControllerProvider) ?? 'コードが読み取れません。',
          ),
          ElevatedButton(
            onPressed: () async {
              if (ref.read(mobileScannerBarcodeControllerProvider) == null) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const SimpleDialog(
                        title: Text('コードが読み取れませんでした。'),
                      );
                    });
              } else {
                await ref
                    .watch(mobileScannerBookControllerProvider.notifier)
                    .fetchBook(
                        barcode:
                            ref.read(mobileScannerBarcodeControllerProvider)!)
                    .then(
                  (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MobileScannerSampleDetail(
                          book: value,
                        ),
                      ),
                    );
                  },
                );
              }
            },
            child: const Text(
              '読み取り完了',
            ),
          ),
        ],
      ),
    );
  }
}
