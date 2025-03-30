import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math' as math;

class HooksReactiveShapeMaker extends HookWidget {
  const HooksReactiveShapeMaker({super.key});

  @override
  Widget build(BuildContext context) {
    // State hooks
    final selectedShape = useState<ShapeType>(ShapeType.circle);
    final shapeColor = useState<Color>(Colors.blue);
    final backgroundColor = useState<Color>(Colors.grey.shade100);
    final shapeSize = useState<double>(150.0);
    final pointerPosition = useState<Offset?>(null);
    final screenCenter = useState<Offset>(Offset.zero);

    // 回転角度を計算
    final rotationAngle = useMemoized(() {
      final pointer = pointerPosition.value;
      final center = screenCenter.value;
      if (pointer == null) return 0.0;

      // 画面中心から指の位置へのベクトルを計算
      final dx = pointer.dx - center.dx;
      final dy = pointer.dy - center.dy;

      // atan2で角度を計算
      return math.atan2(dy, dx) + (math.pi / 2);
    }, [pointerPosition.value, screenCenter.value]); // Dependencies array

    // Computed value using useMemoized
    final shapeBorderRadius = useMemoized(() {
      switch (selectedShape.value) {
        case ShapeType.circle:
          return shapeSize.value / 2;
        case ShapeType.roundedSquare:
          return 20.0;
        case ShapeType.square:
          return 0.0;
      }
    }, [selectedShape.value, shapeSize.value]); // Dependencies array

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Reactive Shape Maker (Hooks)',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: backgroundColor.value,
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
                            angle: rotationAngle,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: shapeSize.value,
                              height: shapeSize.value,
                              decoration: BoxDecoration(
                                color: shapeColor.value,
                                borderRadius:
                                    BorderRadius.circular(shapeBorderRadius),
                                boxShadow: [
                                  BoxShadow(
                                    color: shapeColor.value.withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (pointerPosition.value != null)
                          Positioned(
                            left: pointerPosition.value!.dx - 5,
                            top: pointerPosition.value!.dy - 5,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
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
                  // Shape selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ShapeType.values.map((shape) {
                      return IconButton(
                        onPressed: () => selectedShape.value = shape,
                        icon: Icon(
                          shape.icon,
                          color: selectedShape.value == shape
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  // Color selector
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
                                    color: shapeColor.value == color
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
                  // Background color selector
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
                                    color: backgroundColor.value == color
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
                  // Size slider
                  Slider(
                    value: shapeSize.value,
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
  Colors.grey.shade100,
  Colors.blue.shade50,
  Colors.red.shade50,
  Colors.green.shade50,
  Colors.yellow.shade50,
  Colors.purple.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
];
