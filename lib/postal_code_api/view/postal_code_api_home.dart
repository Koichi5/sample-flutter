import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_flutter/postal_code_api/view/postal_code_api_detail.dart';
import 'package:sample_flutter/postal_code_api/view_model/postal_code_repository.dart';

class PostalCodeApiHome extends HookConsumerWidget {
  const PostalCodeApiHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postalCodeController = useTextEditingController();
    final prefectureController = useTextEditingController();
    final address1Controller = useTextEditingController();
    final address2Controller = useTextEditingController();
    final address3Controller = useTextEditingController();
    final address4Controller = useTextEditingController();
    const postalCodeLength = 7;

    void fetchAddress() async {
      final postalCode = int.parse(postalCodeController.text);
      final postalCodeApiResponse =
          await ref.read(fetchPostalCodeApiResponseProvider(postalCode).future);
      prefectureController.text =
          postalCodeApiResponse.addresses?.first.ja?.prefecture ?? '';
      address1Controller.text =
          postalCodeApiResponse.addresses?.first.ja?.address1 ?? '';
      address2Controller.text =
          postalCodeApiResponse.addresses?.first.ja?.address2 ?? '';
      address3Controller.text =
          postalCodeApiResponse.addresses?.first.ja?.address3 ?? '';
      address4Controller.text =
          postalCodeApiResponse.addresses?.first.ja?.address4 ?? '';
    }

    bool isValid() {
      return postalCodeController.text != '' &&
          prefectureController.text != '' &&
          address1Controller.text != '' &&
          address2Controller.text != '' &&
          address3Controller.text != '' &&
          address4Controller.text != '';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('PostalCodeApiHome'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('郵便番号'),
          const Gap(8),
          TextField(
            controller: postalCodeController,
            onChanged: (value) {
              if (value.length == postalCodeLength) {
                fetchAddress();
              }
            },
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '郵便番号を入力してください',
              border: OutlineInputBorder(),
            ),
          ),
          const Gap(16),
          const Text('都道府県'),
          const Gap(8),
          TextField(
            controller: prefectureController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '例）東京都',
            ),
          ),
          const Gap(16),
          const Text('市区町村'),
          const Gap(8),
          TextField(
            controller: address1Controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '例）千代田区',
            ),
          ),
          const Gap(16),
          const Text('町域'),
          const Gap(8),
          TextField(
            controller: address2Controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '例）霞が関',
            ),
          ),
          const Gap(16),
          const Text('番地'),
          const Gap(8),
          TextField(
            controller: address3Controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '例）１丁目１番',
            ),
          ),
          const Gap(16),
          const Text('アパート・建物名'),
          const Gap(8),
          TextField(
            controller: address4Controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '例）１号',
            ),
          ),
          const Gap(24),
          ElevatedButton(
            onPressed: () {
              if (!isValid()) {
                showDialog(
                  context: context,
                  builder: (context) => const SimpleDialog(
                    title: Text('入力内容に誤りがあります'),
                    children: [
                      Center(
                        child: Text(
                          '入力内容に抜け漏れがないか\n再度ご確認ください',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostalCodeApiDetail(
                      postalCode: postalCodeController.text,
                      prefecture: prefectureController.text,
                      address1: address1Controller.text,
                      address2: address2Controller.text,
                      address3: address3Controller.text,
                      address4: address4Controller.text,
                    ),
                  ),
                );
              }
            },
            child: const Text(
              '登 録',
            ),
          ),
        ],
      ),
    );
  }
}
