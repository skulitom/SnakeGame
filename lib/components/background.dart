import 'dart:ui';

import 'package:circleter/components/background-rect.dart';
import 'package:circleter/snake-game.dart';

class GameBackground {
  final SnakeGame game;
  List<BackgroundRect> slidingRects;

  GameBackground(this.game) {
    initialize();
  }

  void initialize() async {
    slidingRects = List<BackgroundRect>();
    spawnBackgroundRect();
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, this.game.screenSize.width, this.game.screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff990fbf);
    canvas.drawRect(bgRect, bgPaint);
    if(slidingRects.length != 0) {
      slidingRects.forEach((BackgroundRect backgroundRect) => backgroundRect.render(canvas));
    }
  }

  void update(double t) {
    if(this.slidingRects.length < 15) {
      this.spawnBackgroundRect();
    }
    slidingRects.removeWhere((BackgroundRect backgroundRect) => backgroundRect.isOffScreen);
    slidingRects.forEach((BackgroundRect backgroundRect) => backgroundRect.update(t));
  }

  void spawnBackgroundRect() {
    this.slidingRects.add(BackgroundRect(this.game));
  }

}