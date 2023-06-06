import 'package:custom_paint_one/pages/animated_arc_page.dart';
import 'package:custom_paint_one/pages/animated_circle_page.dart';
import 'package:custom_paint_one/pages/arc_paint_page.dart';
import 'package:custom_paint_one/pages/circle_paint_page.dart';
import 'package:custom_paint_one/pages/image_paint_page.dart';
import 'package:custom_paint_one/pages/line_paint_page.dart';
import 'package:custom_paint_one/pages/rectangle_paint_page.dart';
import 'package:custom_paint_one/pages/rounded_rectangle_paint_page.dart';
import 'package:custom_paint_one/pages/triangle_paint_page.dart';
import 'package:custom_paint_one/tabbar_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) => const TabBarWidget(
        tabs: [
          Tab(icon: Icon(Icons.circle), text: 'arc'),
          Tab(icon: Icon(Icons.circle), text: 'AnimatedCircle'),
          Tab(icon: Icon(Icons.stacked_line_chart), text: 'Line'),
          Tab(icon: Icon(Icons.crop_landscape), text: 'Rectangle'),
          Tab(icon: Icon(Icons.crop_square), text: 'Rounded Rectangle'),
          Tab(icon: Icon(Icons.circle), text: 'Circle'),
          Tab(icon: Icon(Icons.architecture), text: 'Arc'),
          Tab(icon: Icon(Icons.warning), text: 'Triangle'),
          Tab(icon: Icon(Icons.image), text: 'Image'),
        ],
        children: [
          AnimatedArcPage(),
          RadialProgressWidget(),
          LinePaintPage(),
          RectanglePaintPage(),
          RoundedRectanglePaintPage(),
          CirclePaintPage(),
          ArcPaintPage(),
          TrianglePaintPage(),
          ImagePaintPage(),
        ],
      );
}
