import 'package:dice_dice_dice/model/dice.dart';
import 'package:dice_dice_dice/model/dice_defaults.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_dice.g.dart';

@riverpod
class SelectedDice extends _$SelectedDice {
  @override
  Dice build() {
    return DiceDefaults.defaultDice.elementAt(1);
  }

  void selectDice(Dice newDice) {
    state = newDice;
  }
}
