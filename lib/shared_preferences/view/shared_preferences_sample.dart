import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/shared_preferences/provider/shared_preferences_provider.dart';
import 'package:sample_flutter/shared_preferences/provider/theme_mode_provider.dart';

// class SharedPreferencesSample extends ConsumerWidget {
//   const SharedPreferencesSample({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userNicknameController = TextEditingController();
//     final userHeightController = TextEditingController();
//     final userAgeController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: Center(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width * 0.92,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'ニックネーム',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: const BorderSide(
//                         width: 0.5,
//                         style: BorderStyle.none,
//                       ),
//                     ),
//                   ),
//                   controller: userNicknameController,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: '身長',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: const BorderSide(
//                         width: 0.5,
//                         style: BorderStyle.none,
//                       ),
//                     ),
//                   ),
//                   controller: userHeightController,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: '年齢',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: const BorderSide(
//                         width: 0.5,
//                         style: BorderStyle.none,
//                       ),
//                     ),
//                   ),
//                   controller: userAgeController,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         final doubleHeight =
//                             double.parse(userHeightController.text);
//                         final intAge = int.parse(userAgeController.text);
//                         ref.read(sharedPreferencesProvider.notifier).setValue(
//                               key: userNicknameKey,
//                               value: userNicknameController.text,
//                             );
//                         ref
//                             .read(sharedPreferencesProvider.notifier)
//                             .setValue(key: userHeightKey, value: doubleHeight);
//                         ref
//                             .read(sharedPreferencesProvider.notifier)
//                             .setValue(key: userAgeKey, value: intAge);
//                       },
//                       child: const Text(
//                         'データ保存',
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         ref.watch(sharedPreferencesProvider.notifier).getValue(
//                               key: userNicknameKey,
//                             );
//                         ref.watch(sharedPreferencesProvider.notifier).getValue(
//                               key: userHeightKey,
//                             );
//                         ref.watch(sharedPreferencesProvider.notifier).getValue(
//                               key: userAgeKey,
//                             );
//                       },
//                       child: const Text(
//                         'データ取得',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class SharedPreferencesSample extends ConsumerWidget {
  const SharedPreferencesSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: switchButton(ref),
      ),
    );
  }

  Widget switchButton(WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        await ref.read(themeModeProvider.notifier).toggle();
      },
      icon: Icon(
        _getIconData(
          ref.watch(themeModeProvider),
        ),
      ),
    );
  }

  IconData _getIconData(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return Icons.light_mode_rounded;
      case ThemeMode.dark:
        return Icons.dark_mode_rounded;
      case ThemeMode.system:
      default:
        return Icons.smartphone_rounded;
    }
  }
}
