import 'package:dice_dice_dice/model/dice.dart';
import 'package:dice_dice_dice/model/roll.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'roll_dice.g.dart';

@riverpod
class RollDice extends _$RollDice {
  @override
  Roll build() {
    return Roll.empty;
  }

  void doRoll(Dice dice, int count) {
    state = Roll.roll(dice, count);
  }
}
