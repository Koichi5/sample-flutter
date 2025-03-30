import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'dart:math' as math;

class SignalsReactiveShapeMaker extends StatelessWidget {
  SignalsReactiveShapeMaker({super.key}) {
    selectedShape = signal<ShapeType>(ShapeType.circle);
    shapeColor = signal<Color>(Colors.blue);
    backgroundColor = signal<Color>(Colors.grey.shade100);
    shapeSize = signal<double>(150.0);
    pointerPosition = signal<Offset?>(null);
    screenCenter = signal<Offset>(Offset.zero);

    // 図形の中心位置を計算するSignal
    shapeCenter = computed(() {
      final size = shapeSize.value;
      return Offset(size / 2, size / 2);
    });

    // 回転角度を計算するSignal
    rotationAngle = computed(() {
      final pointer = pointerPosition.value;
      final center = screenCenter.value;
      if (pointer == null) return 0.0;

      // 画面中心から指の位置へのベクトルを計算
      final dx = pointer.dx - center.dx;
      final dy = pointer.dy - center.dy;

      // atan2で角度を計算し、底辺が指を向くように調整（π/2を加算）
      return math.atan2(dy, dx) + (math.pi / 2);
    });

    shapeBorderRadius = computed(() {
      switch (selectedShape.value) {
        case ShapeType.circle:
          return shapeSize.value / 2;
        case ShapeType.roundedSquare:
          return 20.0;
        case ShapeType.square:
          return 0.0;
      }
    });
  }

  late final Signal<ShapeType> selectedShape;
  late final Signal<Color> shapeColor;
  late final Signal<Color> backgroundColor;
  late final Signal<double> shapeSize;
  late final Signal<Offset?> pointerPosition;
  late final Signal<Offset> screenCenter;
  late final ReadonlySignal<Offset> shapeCenter;
  late final ReadonlySignal<double> rotationAngle;
  late final ReadonlySignal<double> shapeBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Reactive Shape Maker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: backgroundColor.watch(context),
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // 画面の中心位置を更新
                  screenCenter.value = Offset(
                    constraints.maxWidth / 2,
                    constraints.maxHeight / 2,
                  );

                  return GestureDetector(
                    onPanStart: (details) {
                      pointerPosition.value = details.localPosition;
                    },
                    onPanUpdate: (details) {
                      pointerPosition.value = details.localPosition;
                    },
                    onPanEnd: (_) {
                      pointerPosition.value = null;
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Transform.rotate(
                            angle: rotationAngle.watch(context),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: shapeSize.watch(context),
                              height: shapeSize.watch(context),
                              decoration: BoxDecoration(
                                color: shapeColor.watch(context),
                                borderRadius: BorderRadius.circular(
                                    shapeBorderRadius.watch(context)),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                        ),
                        Watch((context) {
                          final position = pointerPosition.value;
                          if (position == null) return const SizedBox();
                          return Positioned(
                            left: position.dx - 5,
                            top: position.dy - 5,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.red.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ShapeType.values.map((shape) {
                      return IconButton(
                        onPressed: () => selectedShape.value = shape,
                        icon: Icon(
                          shape.icon,
                          color: selectedShape.watch(context) == shape
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        ...predefinedColors.map((color) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () => shapeColor.value = color,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: shapeColor.watch(context) == color
                                        ? Colors.black
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        ...backgroundColors.map((color) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () => backgroundColor.value = color,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        backgroundColor.watch(context) == color
                                            ? Colors.black
                                            : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Slider(
                    value: shapeSize.watch(context),
                    min: 50,
                    max: 300,
                    onChanged: (value) => shapeSize.value = value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ShapeType {
  circle(Icons.circle_outlined),
  square(Icons.square_outlined),
  roundedSquare(Icons.rounded_corner);

  final IconData icon;
  const ShapeType(this.icon);
}

final predefinedColors = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
];

final backgroundColors = [
  Colors.grey.shade50,
  Colors.blue.shade50,
  Colors.red.shade50,
  Colors.green.shade50,
  Colors.yellow.shade50,
  Colors.purple.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
];
