# Flutter Flame Sprite Test

* sprite is loaded from image file with `loadSprite('imageFileName')`
* SpriteComponent is instantiated above onLoad to make it accessible in update


```dart
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
  ```