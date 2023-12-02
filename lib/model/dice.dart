import 'dart:math';

class Dice {
  String name;
  int min;
  int max;

  Dice(this.name, this.min, this.max);

  int roll() {
    return Random().nextInt(max - min + 1) + min;
  }

  @override
  String toString() {
    return 'Dice{name: $name, min: $min, max: $max}';
  }
}
