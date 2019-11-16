import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'background.dart';

class SnakeGame extends Game {
  Size screenSize;
  double tileSize;
  GameBackground gameBackground;
  bool hasWon = false;

  SnakeGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    this.gameBackground = GameBackground(this);
  }

  void render(Canvas canvas) {
    this.gameBackground.render(canvas);
  }

  void update(double t) {
    this.gameBackground.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
//    double screenCenterX = screenSize.width / 2;
//    double screenCenterY = screenSize.height / 2;
//    if (d.globalPosition.dx >= screenCenterX - 75
//        && d.globalPosition.dx <= screenCenterX + 75
//        && d.globalPosition.dy >= screenCenterY - 75
//        && d.globalPosition.dy <= screenCenterY + 75
//    ) {
//      hasWon = !hasWon;
//    } else {
//      hasWon = false;
//    }
  }
}