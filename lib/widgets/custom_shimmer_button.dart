import 'package:flutter/material.dart';
import 'dart:async';

class CustomShimmerButton extends StatefulWidget {
  const CustomShimmerButton({
    Key? key,
    required this.child,
    required this.width,
    this.controller,
    this.duration = const Duration(seconds: 2),
    this.enabled = true,
    this.isTiltedLeft = false,
    this.shimmerWidth = 20.0,
    this.shimmerGapWidth = 5.0,
    this.shimmerColor = Colors.black,
    this.delay = const Duration(seconds: 2),
  }) : super(key: key);

  final Widget child;

  final AnimationController? controller;
  final bool enabled;
  final double width;
  final bool isTiltedLeft;
  final double shimmerWidth;
  final double shimmerGapWidth;
  final Color shimmerColor;
  final Duration duration;
  final Duration delay;

  @override
  CustomShimmerButtonState createState() => CustomShimmerButtonState();
}

class CustomShimmerButtonState extends State<CustomShimmerButton>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  late AnimationController _controller;
  final double initialOffset = 0.4;

  @override
  void initState() {
    _controller = widget.controller ??
        AnimationController(vsync: this, duration: widget.duration);
        _controller.value = initialOffset;
       
    _controller.addStatusListener(_listener);
    if (widget.enabled) _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _timer = Timer(widget.delay, () {
        _controller.reset();
        _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: widget.width,
        height: 64.0,
        child: AnimatedBuilder(
          animation: _controller,
          child: widget.child,
          builder: (context, child) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  foregroundPainter: ShimmerPainter(
                    offset: _controller.value,
                    isTiltedLeft: widget.isTiltedLeft,
                    shimmerWidth: widget.shimmerWidth,
                    shimmerColor: widget.shimmerColor,
                    shimmerGapWidth: widget.shimmerGapWidth,
                  ),
                  child: child,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

/// CustomPainter that paints the shimmer lines
class ShimmerPainter extends CustomPainter {
  ShimmerPainter({
    required this.offset,
    required this.shimmerWidth,
    required this.shimmerColor,
    required this.isTiltedLeft,
    this.shimmerGapWidth = 5.0,
  });

  double offset;
  final double shimmerWidth;
  final double shimmerGapWidth;
  final Color shimmerColor;
  final bool isTiltedLeft;

  @override
  void paint(Canvas canvas, Size size) {
    final smallShimmerWidth = shimmerWidth / 2;
    final double x = (size.width) * offset - 16;
    final double y = size.height -8;

    if (!isTiltedLeft) {
      final x1 = x - smallShimmerWidth - shimmerGapWidth - (2 * shimmerWidth);
      final x2 = x1 + shimmerWidth;
      final x3 = x2 + shimmerWidth;
      final x4 = x2;

      final x5 = x4 + shimmerGapWidth;
      final x6 = x3 + shimmerGapWidth;
      final x7 = x6 + smallShimmerWidth;
      final x8 = x5 + smallShimmerWidth;

      canvas.drawPath(
        Path()
          ..moveTo(x1, y)
          ..lineTo(x2, 0)
          ..lineTo(x3, 0)
          ..lineTo(x4, y)
          ..close(),
        Paint()..color = shimmerColor,
      );

      canvas.drawPath(
        Path()
          ..moveTo(x5, y)
          ..lineTo(x6, 0)
          ..lineTo(x7, 0)
          ..lineTo(x8, y)
          ..close(),
        Paint()..color = shimmerColor,
      );
    } else {
      final x8 = x;
      final x7 = x8 - shimmerWidth;
      final x6 = x7 - shimmerWidth;
      final x5 = x7;

      final x4 = x5 - shimmerGapWidth;
      final x3 = x6 - shimmerGapWidth;
      final x2 = x3 - smallShimmerWidth;
      final x1 = x4 - smallShimmerWidth;

      canvas.drawPath(
        Path()
          ..moveTo(x1, y)
          ..lineTo(x2, 0)
          ..lineTo(x3, 0)
          ..lineTo(x4, y)
          ..close(),
        Paint()..color = shimmerColor,
      );

      canvas.drawPath(
        Path()
          ..moveTo(x5, y)
          ..lineTo(x6, 0)
          ..lineTo(x7, 0)
          ..lineTo(x8, y)
          ..close(),
        Paint()..color = shimmerColor,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
