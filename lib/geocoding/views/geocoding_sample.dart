import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_flutter/geocoding/providers/geocoding_provider.dart';

class GiocodingSample extends ConsumerWidget {
  const GiocodingSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('現在位置'),
      ),
      body: FutureBuilder(
        future:
            ref.read(geocodingControllerProvider.notifier).getCurrentAddress(),
        builder: (BuildContext context, AsyncSnapshot<Address> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(
                    snapshot.error.toString(),
                  ),
                ],
              ),
            );
          }
          if (snapshot.hasData) {
            final countryTextController =
                TextEditingController(text: snapshot.data!.country);
            final prefectureTextController =
                TextEditingController(text: snapshot.data!.prefecture);
            final cityTextController =
                TextEditingController(text: snapshot.data!.city);
            final streetTextController =
                TextEditingController(text: snapshot.data!.street);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('国'),
                  TextField(
                    controller: countryTextController,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  const Gap(20),
                  const Text('都道府県'),
                  TextField(
                    controller: prefectureTextController,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  const Gap(20),
                  const Text('市区町村'),
                  TextField(
                    controller: cityTextController,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  const Gap(20),
                  const Text('番地'),
                  TextField(
                    controller: streetTextController,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  const Gap(40),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          '登録',
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () async {
                        await showSearchFromPositionDialog(
                          context: context,
                          countryTextController: countryTextController,
                          prefectureTextController: prefectureTextController,
                          cityTextController: cityTextController,
                          streetTextController: streetTextController,
                          ref: ref,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          '座標から検索',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Column(
              children: [
                Center(
                  child: Text('データが存在しません'),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<void> showSearchFromPositionDialog({
    required BuildContext context,
    required TextEditingController countryTextController,
    required TextEditingController prefectureTextController,
    required TextEditingController cityTextController,
    required TextEditingController streetTextController,
    required WidgetRef ref,
  }) async {
    final longitudeTextController = TextEditingController();
    final latitudeTextController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '座標から検索',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                const Gap(20),
                const Text('経度'),
                TextField(
                  controller: latitudeTextController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const Gap(20),
                const Text('緯度'),
                TextField(
                  controller: longitudeTextController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const Gap(20),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '例）大阪梅田駅: 34.7013302 , 135.4945564',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const Gap(20),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final latitude =
                            double.parse(latitudeTextController.text);
                        final longitude =
                            double.parse(longitudeTextController.text);
                        await ref
                            .read(geocodingControllerProvider.notifier)
                            .getAddressInfoFromPosition(
                                latitude: latitude, longitude: longitude)
                            .then((address) {
                          countryTextController.text = address.country;
                          prefectureTextController.text = address.prefecture;
                          cityTextController.text = address.city;
                          streetTextController.text = address.street;
                        });
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          '検 索',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
