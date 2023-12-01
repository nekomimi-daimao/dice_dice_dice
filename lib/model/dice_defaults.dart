import 'package:dice_dice_dice/model/dice.dart';

class DiceDefaults {
  static final Set<Dice> defaultDice = {
    Dice("d4", 1, 4),
    Dice("d6", 1, 6),
    Dice("d8", 1, 8),
    Dice("d10", 0, 9),
    Dice("d12", 1, 12),
    Dice("d20", 1, 20),
    Dice("d100", 1, 100),
  };

  static final defaultTable = Map.fromIterables(
      defaultDice.map((e) => e.name), defaultDice.map((e) => e));
}
