import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottieIconSize {
  small(size: 20),
  medium(size: 30),
  large(size: 40),
  extraLarge(size: 60);

  final double size;

  const LottieIconSize({required this.size});
}

class LottieIcon extends StatefulWidget {
  const LottieIcon({
    super.key,
    required this.lottiePath,
    required this.isSelected,
    this.size = LottieIconSize.small,
  });

  final String lottiePath;
  final bool isSelected;
  final LottieIconSize size;

  @override
  State<LottieIcon> createState() => _LottieIconState();
}

class _LottieIconState extends State<LottieIcon> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _wasSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didUpdateWidget(LottieIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_wasSelected && widget.isSelected) {
      _controller.forward().then((_) => _controller.reset());
    }
    _wasSelected = widget.isSelected;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.lottiePath,
      width: widget.size.size,
      height: widget.size.size,
      alignment: Alignment.center,
      controller: _controller,
      onLoaded: (composition) {
        _controller.duration = composition.duration;
      },
    );
  }
}
