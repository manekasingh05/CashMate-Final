import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  final birdYaxis;
  final double birdWidth;
  final double birdheight;

  MyBird({this.birdYaxis, required this.birdWidth, required this.birdheight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, (2 * birdYaxis + birdheight) / (2 - birdheight)),
      child: Image.asset(
        'images/fly-bird.png',
        width: MediaQuery.of(context).size.height * birdWidth / 1.5,
        height: MediaQuery.of(context).size.height * 3 / 4 * birdheight / 1.5,
        fit: BoxFit.fill,
      ),
    );
  }
}
