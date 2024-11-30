import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseTransformationControllerSample extends HookWidget {
  const UseTransformationControllerSample({super.key});

  @override
  Widget build(BuildContext context) {
    // useTransformationController を使用して TransformationController を作成
    final transformationController = useTransformationController();
    final scale = useState(1.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('useTransformationController サンプル'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // リセットボタンを押すと、変換をリセット
              transformationController.value = Matrix4.identity();
            },
            tooltip: 'リセット',
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          transformationController: transformationController,
          constrained: true,
          panEnabled: true,
          scaleEnabled: true,
          boundaryMargin: const EdgeInsets.all(16),
          minScale: 0.5,
          maxScale: 3.0,
          onInteractionUpdate: (details) {
            scale.value = transformationController.value.getMaxScaleOnAxis();
          },
          child: SizedBox(
            height: 300,
            child: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
