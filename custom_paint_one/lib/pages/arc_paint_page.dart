import 'package:flutter/material.dart';

class ArcPaintPage extends StatelessWidget {
  const ArcPaintPage({super.key});

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
            painter: ArcPainter(),
          ),
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 7.5
      ..style = PaintingStyle.stroke;

    final arcLeft = Path();
    arcLeft.moveTo(size.width * 0.45, size.height * 0.1);
    arcLeft.arcToPoint(Offset(size.width * 0.45, size.height * 0.9),
        radius: const Radius.circular(75), clockwise: false);
    canvas.drawPath(arcLeft, paint);
    canvas.drawPath(arcLeft, paint);
    //
    final arcRight = Path();
    arcRight.moveTo(size.width * 0.55, size.height * 0.1);
    arcRight.arcToPoint(Offset(size.width * 0.55, size.height * 0.9),
        radius: const Radius.circular(75), clockwise: true);
    canvas.drawPath(arcRight, paint);
    canvas.drawPath(arcRight, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
