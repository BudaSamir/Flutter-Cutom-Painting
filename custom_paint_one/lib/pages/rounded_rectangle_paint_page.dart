import 'package:flutter/material.dart';

class RoundedRectanglePaintPage extends StatelessWidget {
  const RoundedRectanglePaintPage({super.key});

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
            foregroundPainter: RoundedRectanglePainter(),
          ),
        ),
      ),
    );
  }
}

class RoundedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke; // border
    final a = Offset(size.width * 1 / 6, size.height * 1 / 4);
    final b = Offset(size.width * 5 / 6, size.height * 3 / 4);

    final rect = Rect.fromPoints(a, b);
    final radius = Radius.circular(32);
    final rrect = RRect.fromRectAndRadius(rect, radius);
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
