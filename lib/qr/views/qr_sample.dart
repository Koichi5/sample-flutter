import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrSample extends StatelessWidget {
  const QrSample({super.key});

  static const String qrData = 'https://portfolio-next-seven-liart.vercel.app/ja';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR'),
      ),
      body: Center(
        child: QrImageView(
          data: qrData,
          size: 300,
        ),
      ),
    );
  }
}
