import 'package:flutter/material.dart';

/// A custom widget that adds an indent to the left or right of its child.
///
/// The [BlockQuoteWidget] widget is used to create a visual indent in the UI.
/// It takes a [child] parameter which is the content of the widget,
/// a [direction] parameter which specifies the direction of the indent,
/// and a [color] parameter to set the color of the indent.
class BlockQuoteWidget extends StatelessWidget {
  const BlockQuoteWidget({
    super.key,
    required this.child,
    required this.direction,
    required this.color,
  });

  /// The child widget to be indented.
  final Widget child;

  /// The direction of the indent.
  final TextDirection direction;

  /// The color of the indent.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: IndentPainter(color, direction),
      child: child,
    );
  }
}

/// A custom painter that draws an indent on a canvas.
///
/// The [IndentPainter] class extends CustomPainter and is responsible for
/// painting the indent on a canvas. It takes a [color] and [direction] parameter
/// and uses them to draw an indent in the UI.
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
