import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDraw extends CustomPainter {
  final double progress;

  CustomDraw(this.progress);


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.cubicTo(0, 500,  size.width / 2, size.height / 2,300, 900);

//    double currentLength = totalLength * animationPercent;
//    final newPath = new Path();
//    PathMetrics pathMetrics = path.computeMetrics();
//    for(int i = 0 ; i < pathMetrics.length; i++){
//      var metric = pathMetrics.elementAt(i).length;
//      var nextLength = currentLength + metric;
//    }


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return progress != 1;
  }
}