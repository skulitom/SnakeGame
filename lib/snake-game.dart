import 'dart:ui';

import 'package:circleter/components/obstacle-manager.dart';
import 'package:circleter/components/snake.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'components/background.dart';

class SnakeGame extends Game {
  Size screenSize;
  double tileSize;
  GameBackground gameBackground;
  ObstaclesManager obstaclesManager;
  Snake snake;
  bool hasWon = false;

  SnakeGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    this.gameBackground = new GameBackground(this);
    this.obstaclesManager = new ObstaclesManager(this);
    this.snake = new Snake(this);
  }

  void render(Canvas canvas) {
    this.gameBackground.render(canvas);
    this.obstaclesManager.render(canvas);
    this.snake.render(canvas);
  }

  void update(double t) {
    this.gameBackground.update(t);
    this.obstaclesManager.update(t);
    this.snake.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void onHorizontalDragEnd(DragEndDetails d) {
    if(d.primaryVelocity == 0) return; // user have just tapped on screen (no dragging)

    if (d.primaryVelocity.compareTo(0) == -1) {
      this.snake.swipeLeft();
    }
    else {
      this.snake.swipeRight();
    }
  }
}