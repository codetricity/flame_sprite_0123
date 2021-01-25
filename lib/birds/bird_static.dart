/// example of sprite with no animation
///
import 'package:flame/components.dart';
import 'package:flame/composition.dart';

import '../main.dart';

class BirdStatic extends SpriteComponent with HasGameRef<BirdGame> {
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
