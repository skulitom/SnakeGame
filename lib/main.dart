import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:circleter/snake-game.dart';
import 'package:flutter/gestures.dart';

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  DragGestureRecognizer dragger = HorizontalDragGestureRecognizer();
  SnakeGame game = SnakeGame();
  dragger.onEnd = game.onHorizontalDragEnd;

  runApp(game.widget);
  flameUtil.addGestureRecognizer(dragger);
}
