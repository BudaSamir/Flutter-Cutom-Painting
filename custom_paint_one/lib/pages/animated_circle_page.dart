// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgressWidget extends StatefulWidget {
  const RadialProgressWidget({super.key});

  @override
  State<RadialProgressWidget> createState() => _RadialProgressWidgetState();
}

class _RadialProgressWidgetState extends State<RadialProgressWidget> {
  final double percentage = 100.0;
  var value = 0.0;
  final speed = 0.5;
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 1000 ~/ 60), (timer) {
      if (value <= percentage) {
        setState(() {
          value += speed;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: CustomPaint(
            painter: RadialProgressPainter(value),
          ),
        ),
      ),
    );
  }
}

class RadialProgressPainter extends CustomPainter {
  double percentage;
  RadialProgressPainter(this.percentage);
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2.0, size.height / 2.0);
    final rect = Rect.fromCenter(center: c, width: 200.0, height: 200.0);
    final rect2 = Rect.fromPoints(Offset(size.width * 0.5, size.height * 0.1),
        Offset(size.width * 0.47, size.height * 0.9));
    // drawGuide(canvas, c, 100.0);
    drawArc(canvas, rect);
  }

  void drawArc(Canvas canvas, Rect rect) {
    const startAngle = -90.0 * pi / 180.0;
    final sweepAngle = percentage * pi / 100.0;
    final paint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  void drawGuide(Canvas canvas, Offset c, double radius) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(c, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
