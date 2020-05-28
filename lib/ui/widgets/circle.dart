import 'package:flutter/material.dart';

class Circle extends CustomPainter {
  Circle(this._radius,  this._secondRadius , this.rePaint,);

  final double _radius;
  final double _secondRadius;
  final bool rePaint;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint;
    paint = Paint()
      ..color = Colors.black.withOpacity(0.03)
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width/2, size.height/2), _radius, paint);
    if(_secondRadius != 0){
      canvas.drawCircle(Offset(size.width/2, size.height/2), _secondRadius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
