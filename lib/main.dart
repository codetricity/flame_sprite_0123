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
  @override
  Future<void> onLoad() async {
    var birdSprite = await loadSprite('bird.png');
    // pass sprite and screensize
    add(Bird(birdSprite, size));
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

class Bird extends SpriteComponent {
  final screensize;
  Bird(birdSprite, this.screensize)
      : super.fromSprite(Vector2(100, 79), birdSprite);

  @override
  void onMount() {
    super.onMount();
    this.x = 100.0;
    this.y = 50.0;
    print(screensize);
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
