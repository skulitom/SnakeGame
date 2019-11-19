import 'dart:ui';

import 'package:circleter/snake-game.dart';

class Snake {
  final SnakeGame game;
  bool dead = false;
  Rect snakeRect;
  Path snakeDisplay;
  Paint snakePaint;
  double radius;
  double x;
  double y;

  Snake(this.game) {
    this.snakePaint = Paint();
    this.x = this.game.screenSize.width/2;
    this.y = this.game.screenSize.height - this.game.tileSize*5;
    this.radius = this.game.tileSize;
    snakeRect = Rect.fromLTWH(this.x - this.radius, this.y - this.radius, this.radius*2, this.radius*2);
    this.snakePaint.color = Color(0xff00ff00);
    this.snakePaint.style = PaintingStyle.fill;
    this.snakeDisplay = Path();
  }

  void render(Canvas canvas) {
    this.snakeDisplay.addOval(this.snakeRect);
    canvas.drawPath(snakeDisplay, snakePaint);
  }

  void update(double t) {

  }
}