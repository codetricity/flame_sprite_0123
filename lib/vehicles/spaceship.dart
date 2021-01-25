import 'package:flame/components.dart';
import 'package:flame/composition.dart';

import '../main.dart';

class Ship extends SpriteComponent with HasGameRef<BirdGame> {
  var screensize;
  @override
  void onMount() {
    super.onMount();
    size = Vector2(150, 88);
    anchor = Anchor.center;

    this.x = 100;
    this.y = screensize[1] - 150;
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
