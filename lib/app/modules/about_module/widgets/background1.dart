import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Background1 extends CustomPainter {
  final Color color;

  Background1({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    Path path = Path();
    path.lineTo(0, Get.height * 0.7);
    var star = Offset(Get.width * 0.91, Get.height * 0.81);
    var end = Offset(Get.width + 80, 0);
    path.quadraticBezierTo(star.dx, star.dy, end.dx, end.dy);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}