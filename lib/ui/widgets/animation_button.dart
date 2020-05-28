import 'package:flutter/material.dart';

import 'circle.dart';

class AnimationButton extends StatefulWidget {
  @override
  _AnimationButtonState createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _secondAnimationController;
  Animation<double> _radiusAnimation;
  Animation<double> _secondRadiusAnimation;
  bool cancel = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _secondAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _secondAnimationController.forward();
      }
      setState(() {});
    });

    _secondAnimationController.addListener(() {
      if (_secondAnimationController.isCompleted) {
        if (cancel) {
          cancel = false;
          _animationController.reset();
          _secondAnimationController.reset();
        }
      }

      setState(() {});
    });
  }

  @override
  void didUpdateWidget(AnimationButton oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _secondAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _radiusAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _radiusAnimation =
        Tween<double>(begin: 0, end: 100).animate(_radiusAnimation);

    _secondRadiusAnimation = CurvedAnimation(
        parent: _secondAnimationController, curve: Curves.easeInOut);
    _secondRadiusAnimation =
        Tween<double>(begin: 0, end: 100).animate(_secondRadiusAnimation);
    return Center(
      child: GestureDetector(
        onTapUp: (details) {
          if (!_animationController.isCompleted) {
            cancel = true;
            _secondAnimationController.forward();
          } else {
            _animationController.reset();
            _secondAnimationController.reset();
          }
        },
        onTapDown: (details) {
          _animationController.forward();
        },
        child: CustomPaint(
          painter: Circle(
              _radiusAnimation.value, _secondRadiusAnimation.value, true),
          size: Size(100, 100),
          child: Container(
            height: 100,
            width: 100,
            child: Center(
              child: SizeTransition(
                  sizeFactor: null,
                  child: Icon(Icons.add)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
