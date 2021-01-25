/// Bird created from SpriteAnimationComponent

import 'package:flame/components.dart';
import 'package:flame/composition.dart';

import '../main.dart';

class BirdAnimated extends SpriteAnimationComponent with HasGameRef<BirdGame> {
  @override
  void onMount() {
    super.onMount();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    this.y += 1;
  }
}
