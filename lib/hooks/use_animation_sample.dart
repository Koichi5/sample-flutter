import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UseAnimationSample(),
    );
  }
}

class UseAnimationSample extends HookWidget {
  const UseAnimationSample({super.key});

  @override
  Widget build(BuildContext context) {
final controller = useAnimationController(
  duration: const Duration(milliseconds: 500),
);

    final animation = useAnimation(
      Tween<double>(begin: 100.0, end: 200.0).animate(controller),
    );

    final isExpanded = useState<bool>(false);

    // ボタンが押されたときの処理
    void toggleBoxSize() {
      if (isExpanded.value) {
        controller.reverse();
      } else {
        controller.forward();
      }
      isExpanded.value = !isExpanded.value;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('サイズアニメーションサンプル'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // アニメーションするボックス
            Container(
              width: animation,
              height: animation,
              color: Colors.blue,
            ),
            const SizedBox(height: 40),
            // サイズを切り替えるボタン
            ElevatedButton(
              onPressed: toggleBoxSize,
              child: Text(isExpanded.value ? '縮小' : '拡大'),
            ),
          ],
        ),
      ),
    );
  }
}
