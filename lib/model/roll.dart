import 'package:dice_dice_dice/model/dice.dart';

class Roll {
  final Dice dice;
  final int count;
  final List<int> result;

  Roll(this.dice, this.count, this.result);

  static Roll roll(Dice dice, int count) {
    return Roll(dice, count, List.generate(count, (i) => dice.roll()));
  }

  int sum() => result.reduce((a, b) => a + b);
}
