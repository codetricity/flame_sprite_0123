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
  @override
  Future<void> onLoad() async {
    var birdSprite = await loadSprite('bird.png');
    // pass sprite and screensize
    add(bird
      ..screensize = size
      ..sprite = birdSprite);
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

class Bird extends SpriteComponent with HasGameRef<BirdGame> {
  var screensize;

  @override
  void onMount() {
    super.onMount();
    size = Vector2(100, 79);

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
