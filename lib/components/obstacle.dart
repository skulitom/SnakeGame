import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../snake-game.dart';

class Obstacle {
  final SnakeGame game;
  final double minimumGap = 3;
  double leftLength = 1;
  double rightLength = 1;
  Size size;
  Random rng;
  Path triangleLeft;
  Path triangleRight;
  bool isOffScreen = false;
  Paint triangleColor;
  double x;
  double y;

  Obstacle(this.game) {
    this.rng = Random();
    this.x = 0;
    this.y = -this.game.tileSize*3;
    this.setObstacleLengths();
    this.triangleColor = Paint();
    this.triangleColor.color = Color(0xff000000);
    this.triangleColor.style = PaintingStyle.fill;
    this.triangleLeft = Path();
    this.triangleRight = Path();
    this.size = Size(rng.nextInt(3)*10.0+100.0, rng.nextInt(3)*10.0+100.0);
  }

  void render(Canvas canvas){
    triangleLeft.reset();
    triangleLeft.moveTo(this.x, this.y);
    triangleLeft.lineTo(this.x + this.game.tileSize * this.leftLength, this.y+ this.game.tileSize/2);
    triangleLeft.lineTo(this.x, this.y + this.game.tileSize);
    triangleLeft.lineTo(this.x, this.y);
    canvas.drawPath(triangleLeft, triangleColor);
    triangleRight.reset();
    triangleRight.moveTo(this.game.screenSize.width, this.y);
    triangleRight.lineTo(this.game.screenSize.width - this.game.tileSize * this.rightLength, this.y+ this.game.tileSize/2);
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

  void setObstacleLengths() {
    this.leftLength = rng.nextInt(7).toDouble();
    int maximumRight = (9-this.minimumGap-this.leftLength).toInt();
    if(maximumRight != 0) {
      this.rightLength = rng.nextInt(maximumRight).toDouble();
      if(this.leftLength == 0 && this.rightLength == 0) {
        this.rightLength = 3;
      }
    } else {
      this.rightLength = 0;
    }
  }
}