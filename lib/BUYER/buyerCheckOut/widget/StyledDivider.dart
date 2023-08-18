import 'package:flutter/material.dart';

class StyledDivider extends StatelessWidget {
  final double thickness;
  final Color color;
  final double dotSpacing;

  StyledDivider({
    this.thickness = 1.0,
    this.color = Colors.black,
    this.dotSpacing = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedDividerPainter(thickness: thickness, color: color, dotSpacing: dotSpacing),
      child: Container(
        height: thickness,
      ),
    );
  }
}

class _DottedDividerPainter extends CustomPainter {
  final double thickness;
  final Color color;
  final double dotSpacing;

  _DottedDividerPainter({required this.thickness, required this.color, required this.dotSpacing});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final double y = size.height / 2;

    for (double i = 0; i < size.width; i += dotSpacing * 2) {
      canvas.drawLine(Offset(i, y), Offset(i + dotSpacing, y), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
