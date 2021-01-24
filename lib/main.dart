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
  // FlappyBird flappyBird = FlappyBird();
  SpriteAnimationComponent flyingBird = SpriteAnimationComponent();

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
    final yellowFlappingAnimation = SpriteAnimationComponent.fromFrameData(
        spriteSize, spriteSheet, spriteData)
      ..x = 100
      ..y = 350;
    add(yellowFlappingAnimation);

    var flappySheet = await images.load('blue_bird_sheet.png');
    final flappySpriteSize = Vector2(100.0, 79.0);
    SpriteAnimationData flappySpriteData = SpriteAnimationData.sequenced(
        amount: 6, stepTime: 0.2, textureSize: Vector2(100, 79));
    flyingBird = SpriteAnimationComponent.fromFrameData(
        flappySpriteSize, flappySheet, flappySpriteData)
      ..x = 200
      ..y = 100;
    add(flyingBird);
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
    flyingBird.y += 1;
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

class FlappyBird extends SpriteAnimationComponent with HasGameRef<BirdGame> {
  @override
  void onMount() {
    super.onMount();
    this.x = 200;
    this.y = 100;
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
