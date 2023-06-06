import 'package:flutter/material.dart';

class CirclePaintPage extends StatelessWidget {
  const CirclePaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: CustomPaint(
            painter: CirclePainter(),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(
      center,
      size.width * 1 / 4,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
