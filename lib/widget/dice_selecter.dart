import 'package:dice_dice_dice/model/dice.dart';
import 'package:dice_dice_dice/model/dice_defaults.dart';
import 'package:dice_dice_dice/provider/selected_dice.dart';
import 'package:dice_dice_dice/widget/dice_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DiceSelector extends HookConsumerWidget {
  const DiceSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(diceSelectedProvider);

    return DropdownMenu<Dice>(
        initialSelection: selected,
        requestFocusOnTap: false,
        enableSearch: false,
        enableFilter: false,
        label: const Text('Dice'),
        onSelected: (Dice? dice) {
          print(dice?.name);
        },
        dropdownMenuEntries: DiceDefaults.defaultDice
            .map((e) => DropdownMenuEntry<Dice>(
                value: e, label: e.name, labelWidget: DiceView(dice: e)))
            .toList());
  }
}
