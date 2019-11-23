import 'dart:ui';

import 'package:circleter/snake-game.dart';
import 'package:circleter/utils/directions.dart';

class Snake {
  final SnakeGame game;
  bool dead = false;
  bool moving = false;
  double speed;
  direction snakeDirection;
  bool bounced = false;
  double deceleration;
  Rect snakeRect;
  Path snakeDisplay;
  Paint snakePaint;
  double radius;
  double x;
  double y;

  Snake(this.game) {
    this.deceleration = 0.2;
    this.snakeDirection = direction.stationary;
    this.resetSpeed();
    this.snakePaint = Paint();
    this.x = this.game.screenSize.width/2;
    this.y = this.game.screenSize.height - this.game.tileSize*4;
    this.radius = this.game.tileSize;
    snakeRect = Rect.fromLTWH(this.x - this.radius, this.y - this.radius, this.radius*2, this.radius*2);
    this.snakePaint.color = Color(0xff00ff00);
    this.snakePaint.style = PaintingStyle.fill;
    this.snakeDisplay = Path();
  }

  void render(Canvas canvas) {
    this.snakeDisplay.reset();
    snakeRect = Rect.fromLTWH(this.x - this.radius, this.y - this.radius, this.radius*2, this.radius*2);
    this.snakeDisplay.addOval(this.snakeRect);
    canvas.drawPath(snakeDisplay, snakePaint);
  }

  void update(double t) {
    if(this.snakeDirection == direction.stationary) {
      resetSpeed();
      return;
    } else if(snakeDirection == direction.left){
      bounceLeft(t);
      decelerate();
    } else {
      bounceRight(t);
      decelerate();
    }
  }

  void bounceLeft(double t) {
    if(!bounced) {
      if(this.x - this.radius <= 0) {
        bounced = true;
      } else {
        this.x -= this.speed*t;
      }
    } else {
      if(this.x >= this.game.screenSize.width/2){
        this.moving = false;
        bounced = false;
        this.snakeDirection = direction.stationary;
      } else {
        this.x += this.speed*t;
      }
    }
  }

  void bounceRight(double t) {
    if(!bounced) {
      if(this.x + this.radius >= this.game.screenSize.width) {
        bounced = true;
      } else {
        this.x += this.speed*t;
      }
    } else {
      if(this.x <= this.game.screenSize.width/2){
        this.moving = false;
        bounced = false;
        this.snakeDirection = direction.stationary;
      } else {
        this.x -= this.speed*t;
      }
    }
  }

  void swipeLeft() {
    if(!moving) {
      moving = true;
      snakeDirection = direction.left;
    }
  }

  void swipeRight() {
    if(!moving){
      moving = true;
      snakeDirection = direction.right;
    }
  }

  void resetSpeed() {
    this.speed = this.game.tileSize*3;
  }

  void decelerate() {
    if(this.speed > 3) {
      this.speed -= this.deceleration;
    }
  }
}