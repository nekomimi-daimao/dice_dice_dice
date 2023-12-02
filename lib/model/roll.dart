import 'package:dice_dice_dice/model/dice.dart';
import 'package:dice_dice_dice/model/dice_defaults.dart';

class Roll {
  final Dice dice;
  final int count;
  final List<int> result;

  Roll(this.dice, this.count, this.result);

  static Roll roll(Dice dice, int count) {
    return Roll(dice, count, List.generate(count, (i) => dice.roll()));
  }

  static Roll empty = Roll(DiceDefaults.defaultDice.elementAt(1), 1, [1]);

  int sum() => result.reduce((a, b) => a + b);
}
