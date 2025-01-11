import 'package:flutter/material.dart';

class IndentWidget extends StatelessWidget {
  const IndentWidget({
    super.key,
    required this.child,
    required this.direction,
    required this.color,
  });
  final Widget child;
  final TextDirection direction;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: IndentPainter(color, direction),
      child: child,
    );
  }
}

class IndentPainter extends CustomPainter {
  IndentPainter(this.color, this.direction);
  final Color color;
  final TextDirection direction;
  @override
  void paint(Canvas canvas, Size size) {
    var left = direction == TextDirection.ltr;
    var start = left ? 0.0 : size.width - 4;
    var rect = Rect.fromLTWH(start, 0, 4, size.height);
    var paint = Paint()..color = color;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
