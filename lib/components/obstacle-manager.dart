import 'package:circleter/components/obstacle.dart';
import 'package:flutter/cupertino.dart';

import '../snake-game.dart';

class ObstaclesManager {
  final SnakeGame game;
  List<Obstacle> obstacleList;

  ObstaclesManager(this.game) {
    obstacleList = List<Obstacle>();
    this.spawnObstacle();
  }

  void render(Canvas canvas) {
    if(obstacleList.length != 0) {
      obstacleList.forEach((Obstacle obstacle) => obstacle.render(canvas));
    }
  }

  void update(double t) {
    if(obstacleList.length != 0) {
      obstacleList.forEach((Obstacle obstacle) => obstacle.update(t));
    }
  }

  void spawnObstacle() {
    obstacleList.add(Obstacle(this.game));
  }
}