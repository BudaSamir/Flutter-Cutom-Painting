import 'package:flutter/material.dart';

class LinePaintPage extends StatelessWidget {
  const LinePaintPage({super.key});

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
            foregroundPainter: LinePainter(),
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    canvas.drawLine(
      Offset(size.width * 1 / 6, size.height * 1 / 4),
      Offset(size.width * 5 / 6, size.height * 1 / 4),
      paint,
    );

    canvas.drawLine(
      Offset(size.width * 1 / 6, size.height * 2 / 3),
      Offset(size.width * 5 / 6, size.height * 2 / 3),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
