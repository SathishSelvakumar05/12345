import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../custom/car_custom.dart';

class CustomPainterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: RPSCustomPainter(),
        ),
      ),
    );
  }
}
