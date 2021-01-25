import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_sp/birds/bird_animated.dart';
import 'package:flutter/material.dart';

import 'birds/bird_static.dart';
import 'vehicles/spaceship.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BirdGame birdGame = BirdGame();
  runApp(
    GameWidget(game: birdGame),
  );
}

class BirdGame extends BaseGame {
  BirdStatic bird = BirdStatic();
  Ship ship = Ship();
  BirdAnimated flappyBird = BirdAnimated();
  SpriteAnimationComponent yellowFlappingAnimation = SpriteAnimationComponent();

  @override
  Future<void> onLoad() async {
    var birdSprite = await loadSprite('bird.png');
    // pass sprite and screensize
    add(bird
      ..screensize = size
      ..sprite = birdSprite);
    var shipSprite = await loadSprite('airship.png');
    add(ship
      ..screensize = size
      ..sprite = shipSprite);
    var spriteSheet = await images.load('yellow_bird_sheet.png');

    final spriteSize = Vector2(100.0, 88.0);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
        amount: 2, stepTime: 0.3, textureSize: Vector2(100, 88));
    yellowFlappingAnimation = SpriteAnimationComponent.fromFrameData(
        spriteSize, spriteSheet, spriteData)
      ..x = 250
      ..y = 350;
    add(yellowFlappingAnimation);

    var flappySheet = await images.load('blue_bird_sheet.png');
    final flappySpriteSize = Vector2(100.0, 79.0);
    SpriteAnimationData flappySpriteData = SpriteAnimationData.sequenced(
        amount: 6, stepTime: 0.2, textureSize: Vector2(100, 79));
    flappyBird.size = flappySpriteSize;
    flappyBird.animation =
        SpriteAnimation.fromFrameData(flappySheet, flappySpriteData);
    flappyBird.x = 250;
    flappyBird.y = 10;
    add(flappyBird);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (bird.toRect().contains(ship.toRect().center)) {
      print('bird collided with ship and is dead ');
      remove(bird);
    }
    if (flappyBird.toRect().contains(yellowFlappingAnimation.toRect().center)) {
      print(
          'flappy bird and yellow flapping bird collide and unfortunately die');
      remove(flappyBird);
      remove(yellowFlappingAnimation);
    }
  }
}
