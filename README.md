# Flutter Flame Sprite Test

## load and display sprite

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

## collision detection and remove

![collision](doc/screenshot_2021_01_24.gif)

The `bird` and `ship` sprites are instantiated in the main game class.

```dart
  @override
  void update(double dt) {
    super.update(dt);
    if (bird.toRect().contains(ship.toRect().center)) {
      print('bird collided with ship and is dead ');
      remove(bird);
    }
  }
```

## animation from spritesheet

![animation](doc/screenshot_2021_01_24_part2.gif)

```dart
final spriteSize = Vector2(100.0, 88.0);
SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
    amount: 2, stepTime: 0.3, textureSize: Vector2(100, 88));
final yellowFlappingAnimation = SpriteAnimationComponent.fromFrameData(
    spriteSize, spriteSheet, spriteData)
    ..x = 100
    ..y = 350;
add(yellowFlappingAnimation);
```


## Version

* Using flame: ^1.0.0-rc6 as of 1/24/2021