import 'package:dice_dice_dice/model/dice.dart';
import 'package:dice_dice_dice/model/dice_defaults.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_dice.g.dart';

@riverpod
Dice diceSelected(DiceSelectedRef ref) {
  return DiceDefaults.defaultDice.elementAt(1);
}
