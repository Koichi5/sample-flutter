import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PostalCodeApiDetail extends StatelessWidget {
  const PostalCodeApiDetail({
    super.key,
    required this.postalCode,
    required this.prefecture,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.address4,
  });

  final String postalCode;
  final String prefecture;
  final String address1;
  final String address2;
  final String address3;
  final String address4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostalCodeApiDetail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('登録された住所'),
            const Gap(24),
            Text('郵便番号：$postalCode'),
            const Gap(8),
            Text('都道府県：$prefecture'),
            const Gap(8),
            Text('市区町村：$address1'),
            const Gap(8),
            Text('町域：$address2'),
            const Gap(8),
            Text('番地：$address3'),
            const Gap(8),
            Text('アパート・建物名：$address4'),
          ],
        ),
      ),
    );
  }
}
