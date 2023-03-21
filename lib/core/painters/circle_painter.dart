import 'dart:math';

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double borderLength, successValue, strokeWidth;

  CirclePainter(this.borderLength, this.successValue, this.strokeWidth)
      : super();

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final greyCirclePaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(radius, radius),
      radius,
      greyCirclePaint,
    );

    final redCirclePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final redCirclePath = Path();

    redCirclePath.addArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      3 * pi / 2,
      borderLength * pi,
    );

    canvas.drawPath(redCirclePath, redCirclePaint);

    Paint greenPaint = Paint()..color = Colors.greenAccent;

    canvas.drawCircle(
        Offset(radius, radius), successValue * radius, greenPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
