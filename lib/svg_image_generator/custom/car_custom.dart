import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1875000, size.height * 0.06250000);
    path_0.lineTo(size.width * 0.1041669, size.height * 0.3125000);
    path_0.lineTo(0, size.height * 0.3125000);
    path_0.lineTo(0, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.06250000, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.06250000, size.height * 0.9375000);
    path_0.lineTo(size.width * 0.1875000, size.height * 0.9375000);
    path_0.lineTo(size.width * 0.1875000, size.height * 0.8125000);
    path_0.lineTo(size.width * 0.8125000, size.height * 0.8125000);
    path_0.lineTo(size.width * 0.8125000, size.height * 0.9375000);
    path_0.lineTo(size.width * 0.9375000, size.height * 0.9375000);
    path_0.lineTo(size.width * 0.9375000, size.height * 0.5000000);
    path_0.lineTo(size.width, size.height * 0.5000000);
    path_0.lineTo(size.width, size.height * 0.3125000);
    path_0.lineTo(size.width * 0.8958312, size.height * 0.3125000);
    path_0.lineTo(size.width * 0.8125000, size.height * 0.06250000);
    path_0.lineTo(size.width * 0.1875000, size.height * 0.06250000);
    path_0.close();
    path_0.moveTo(size.width * 0.2500000, size.height * 0.5625000);
    path_0.cubicTo(
        size.width * 0.2154825,
        size.height * 0.5625000,
        size.width * 0.1875000,
        size.height * 0.5904825,
        size.width * 0.1875000,
        size.height * 0.6250000);
    path_0.cubicTo(
        size.width * 0.1875000,
        size.height * 0.6595188,
        size.width * 0.2154825,
        size.height * 0.6875000,
        size.width * 0.2500000,
        size.height * 0.6875000);
    path_0.cubicTo(
        size.width * 0.2845175,
        size.height * 0.6875000,
        size.width * 0.3125000,
        size.height * 0.6595188,
        size.width * 0.3125000,
        size.height * 0.6250000);
    path_0.cubicTo(
        size.width * 0.3125000,
        size.height * 0.5904825,
        size.width * 0.2845175,
        size.height * 0.5625000,
        size.width * 0.2500000,
        size.height * 0.5625000);
    path_0.close();
    path_0.moveTo(size.width * 0.7224063, size.height * 0.1875000);
    path_0.lineTo(size.width * 0.2775950, size.height * 0.1875000);
    path_0.lineTo(size.width * 0.1942619, size.height * 0.4375000);
    path_0.lineTo(size.width * 0.8057375, size.height * 0.4375000);
    path_0.lineTo(size.width * 0.7224063, size.height * 0.1875000);
    path_0.close();
    path_0.moveTo(size.width * 0.7500000, size.height * 0.5625000);
    path_0.cubicTo(
        size.width * 0.7154812,
        size.height * 0.5625000,
        size.width * 0.6875000,
        size.height * 0.5904825,
        size.width * 0.6875000,
        size.height * 0.6250000);
    path_0.cubicTo(
        size.width * 0.6875000,
        size.height * 0.6595188,
        size.width * 0.7154812,
        size.height * 0.6875000,
        size.width * 0.7500000,
        size.height * 0.6875000);
    path_0.cubicTo(
        size.width * 0.7845188,
        size.height * 0.6875000,
        size.width * 0.8125000,
        size.height * 0.6595188,
        size.width * 0.8125000,
        size.height * 0.6250000);
    path_0.cubicTo(
        size.width * 0.8125000,
        size.height * 0.5904825,
        size.width * 0.7845188,
        size.height * 0.5625000,
        size.width * 0.7500000,
        size.height * 0.5625000);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
