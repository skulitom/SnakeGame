import 'dart:math';

import 'package:circleter/snake-game.dart';
import 'package:flutter/cupertino.dart';

class BackgroundRect {
  final SnakeGame game;
  final double speedMultiplier = 0.98;
  Rect backgroundRect;
  bool isOffScreen = false;
  double x;
  double y;
  double width;
  double height;
  double speed;
  Paint blockColor = Paint();
  Random rng = Random();

  BackgroundRect(this.game) {
    setRandomDimensions();
    speed = this.getRandomInt() * this.speedMultiplier;
    backgroundRect = Rect.fromLTWH(this.x, this.y, this.width, this.height);
    this.blockColor.color = Color(0x55ffffff);
  }

  void setRandomDimensions() {
    this.x = rng.nextDouble() * this.game.screenSize.width;
    this.y = rng.nextDouble() * -this.game.screenSize.height;
    this.width = this.game.tileSize * this.getRandomInt();
    this.height = this.width;
  }

  void render(Canvas canvas) {
    canvas.drawRect(backgroundRect, blockColor);
  }

  int getRandomInt() {
    return (this.rng.nextInt(3) + 1);
  }

  void update(double t) {
    if(this.backgroundRect.top > this.game.screenSize.height) {
      this.isOffScreen = true;
    }
    this.backgroundRect = this.backgroundRect.translate(0, this.game.tileSize * speed * t);
  }
}