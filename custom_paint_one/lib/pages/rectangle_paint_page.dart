import 'package:flutter/material.dart';

class RectanglePaintPage extends StatelessWidget {
  const RectanglePaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          color: Colors.white,
          height: 300,
          width: 300,
          child: CustomPaint(
            foregroundPainter: RectanglePainter(),
          ),
        ),
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke; // border
    final a = Offset(size.width * 1 / 6, size.height * 1 / 4);
    final b = Offset(size.width * 5 / 6, size.height * 3 / 4);

    final rect = Rect.fromPoints(a, b);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
