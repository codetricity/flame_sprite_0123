import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BirdGame birdGame = BirdGame();
  runApp(
    GameWidget(game: birdGame),
  );
}

class BirdGame extends BaseGame {
  Bird bird = Bird();
  Ship ship = Ship();
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
    final aniCom2 = SpriteAnimationComponent.fromFrameData(
        spriteSize, spriteSheet, spriteData)
      ..x = 100
      ..y = 350;
    add(aniCom2);
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
  }
}

class Bird extends SpriteComponent with HasGameRef<BirdGame> {
  var screensize;

  @override
  void onMount() {
    super.onMount();
    size = Vector2(100, 79);

    this.x = 100.0;
    this.y = 50.0;
    print(screensize);
    anchor = Anchor.center;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (y < screensize[1]) {
      this.y += 1;
    } else {
      y = 0;
    }
  }
}

class Ship extends SpriteComponent with HasGameRef<BirdGame> {
  var screensize;
  @override
  void onMount() {
    super.onMount();
    size = Vector2(150, 88);
    anchor = Anchor.center;

    this.x = 100;
    this.y = screensize[1] - 50;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
