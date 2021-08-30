import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Background2 extends CustomPainter{
  final Color color;

  Background2({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    Path path = Path();
    path.lineTo(0, Get.height * 0.69);
    var star = Offset(Get.width * 0.9, Get.height * 0.8);
    var end = Offset(Get.width + 70, 0);
    path.quadraticBezierTo(star.dx, star.dy, end.dx, end.dy);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}