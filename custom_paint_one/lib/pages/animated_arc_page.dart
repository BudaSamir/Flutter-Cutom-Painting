// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedArcPage extends StatefulWidget {
  const AnimatedArcPage({super.key});

  @override
  State<AnimatedArcPage> createState() => _AnimatedArcPageState();
}

class _AnimatedArcPageState extends State<AnimatedArcPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    final curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    animation = Tween(begin: 0.0, end: 3.14).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    animationController.dispose();
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
            painter: AnimatedArc(
              arc: animation.value,
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedArc extends CustomPainter {
  double arc;
  AnimatedArc({
    required this.arc,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, 300, 300);

    // drawGuide(canvas, c, 100.0);
    drawArc(canvas, rect);
  }

  void drawArc(Canvas canvas, Rect rect) {
    const startAngle = -math.pi;
    final sweepAngle = arc != null ? arc : math.pi;

    final paint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
