import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../snake-game.dart';

class Obstacle {
  final SnakeGame game;
  Size size;
  Random rng;
  Path triangleLeft;
  Path triangleRight;
  bool isOffScreen = false;
  Paint triangleColor;
  double x;
  double y;

  Obstacle(this.game) {
    this.x = 0;
    this.y = 0;
    this.triangleColor = Paint();
    this.triangleColor.color = Color(0xff000000);
    this.triangleColor.style = PaintingStyle.fill;
    this.triangleLeft = Path();
    this.triangleRight = Path();
    this.rng = Random();
    this.size = Size(rng.nextInt(3)*10.0+100.0, rng.nextInt(3)*10.0+100.0);
  }

  void render(Canvas canvas){
    triangleLeft.reset();
    triangleLeft.moveTo(this.x, this.y);
    triangleLeft.lineTo(this.x + this.game.tileSize * 3, this.y+ this.game.tileSize/2);
    triangleLeft.lineTo(this.x, this.y + this.game.tileSize);
    triangleLeft.lineTo(this.x, this.y);
    canvas.drawPath(triangleLeft, triangleColor);
    triangleRight.reset();
    triangleRight.moveTo(this.game.screenSize.width, this.y);
    triangleRight.lineTo(this.game.screenSize.width - this.game.tileSize * 3, this.y+ this.game.tileSize/2);
    triangleRight.lineTo(this.game.screenSize.width, this.y + this.game.tileSize);
    triangleRight.lineTo(this.game.screenSize.width, this.y);
    canvas.drawPath(triangleRight, triangleColor);
  }

  void update(double t) {
    if(this.y > this.game.screenSize.height) {
      this.isOffScreen = true;
    }
    this.y = this.y + this.game.tileSize * t;
  }
}