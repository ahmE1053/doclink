import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final backPaint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(size.width, size.height),
        [
          const Color(0xff7b50e7),
          const Color(0xffefbbe8),
        ],
      );
    final backPath = Path()
      ..moveTo(size.width * .2, 0)
      ..lineTo(size.width * .2, size.height * .96);
    final backMiddlePoint = Offset(size.width * 0.8, size.height * 0.8);
    final backLastPoint = Offset(size.width, size.height * 0.95);
    backPath
      ..quadraticBezierTo(backMiddlePoint.dx, backMiddlePoint.dy,
          backLastPoint.dx, backLastPoint.dy)
      ..lineTo(size.width, 0);

    canvas.drawPath(backPath, backPaint);

    final mainPaint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(0.0, 0.0),
        Offset(
          size.width,
          size.height,
        ),
        [
          const Color(0xffd4bbf3),
          const Color(0xff90c6fc),
        ],
        [0.2, 0.6],
      );
    final mainPath = Path()..lineTo(0, size.height * 0.95);
    final firstMainMiddlePoint = Offset(size.width * 0.2, size.height);
    final firstMainLastPoint = Offset(size.width * 0.45, size.height * 0.88);
    mainPath.quadraticBezierTo(firstMainMiddlePoint.dx, firstMainMiddlePoint.dy,
        firstMainLastPoint.dx, firstMainLastPoint.dy);
    final secondMainMiddlePoint = Offset(size.width * 0.75, size.height * 0.75);
    final secondMainLastPoint = Offset(size.width, size.height * 0.85);
    mainPath.quadraticBezierTo(
        secondMainMiddlePoint.dx,
        secondMainMiddlePoint.dy,
        secondMainLastPoint.dx,
        secondMainLastPoint.dy);
    mainPath.lineTo(size.width, 0);
    canvas.drawPath(mainPath, mainPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
