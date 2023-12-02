import 'package:dice_dice_dice/model/dice.dart';
import 'package:dice_dice_dice/model/dice_defaults.dart';
import 'package:dice_dice_dice/provider/selected_dice.dart';
import 'package:dice_dice_dice/widget/const_widgets.dart';
import 'package:dice_dice_dice/widget/dice_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DiceSelector extends HookConsumerWidget {
  const DiceSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedDiceProvider);

    return DropdownButton<Dice>(
      value: selected,
      itemHeight: ConstWidgets.diceViewHeight + 10,
      menuMaxHeight: (ConstWidgets.diceViewHeight + 10) * 6,
      iconSize: 0,
      focusColor: Colors.transparent,
      underline: const SizedBox(
        width: 0,
        height: 0,
      ),
      onChanged: (Dice? value) {
        if (value == null) {
          return;
        }
        ref.read(selectedDiceProvider.notifier).selectDice(value);
      },
      items: DiceDefaults.defaultDice
          .map(
              (e) => DropdownMenuItem<Dice>(value: e, child: DiceView(dice: e)))
          .toList(),
    );
  }
}
