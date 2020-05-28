import 'package:draw/ui/widgets/animation_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
//        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
//        padding: const EdgeInsets.only(left: 200.0, right: 20.0),
        color: Colors.white,
        child: AnimationButton());
  }
}
