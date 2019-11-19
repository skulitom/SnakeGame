import 'dart:math';

import 'package:circleter/components/obstacle.dart';
import 'package:flutter/cupertino.dart';

import '../snake-game.dart';

class ObstaclesManager {
  final SnakeGame game;
  final double minimumWait = 10;
  Random rng;
  double timer = 0;
  int randomDisplacement;
  List<Obstacle> obstacleList;

  ObstaclesManager(this.game) {
    rng = Random();
    randomDisplacement = rng.nextInt(minimumWait.toInt());
    obstacleList = List<Obstacle>();
    this.spawnObstacle();
  }

  void render(Canvas canvas) {
    if(obstacleList.length != 0) {
      obstacleList.forEach((Obstacle obstacle) => obstacle.render(canvas));
    }
  }

  void update(double t) {
    timer += t;
    if(timer > (minimumWait + randomDisplacement)){
      this.spawnObstacle();
      rng.nextInt(minimumWait.toInt());
      timer = 0;
    }

    if(obstacleList.length != 0) {
      obstacleList.forEach((Obstacle obstacle) => obstacle.update(t));
    }
  }

  void spawnObstacle() {
    obstacleList.add(Obstacle(this.game));
  }
}