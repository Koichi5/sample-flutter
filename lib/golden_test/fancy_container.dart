import 'package:flutter/material.dart';

class FancyContainer extends StatelessWidget {
  const FancyContainer({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final textStyle =
        TextStyle(color: color == Colors.black ? Colors.white : Colors.black);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color ?? Colors.amber[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hey there!',
              style: textStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Hi',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}