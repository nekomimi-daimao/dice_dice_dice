import 'package:dice_dice_dice/provider/roll_dice.dart';
import 'package:dice_dice_dice/widget/dice_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RollResult extends ConsumerWidget {
  const RollResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roll = ref.watch(rollDiceProvider);

    List<Widget> results = [];
    results.add(Text("${roll.sum()} = "));
    results.addAll(roll.result.map((e) => Text(e.toString())));

    return Container(
        width: 200,
        height: 200,
        child: Column(
          children: [
            Row(
              children: [
                DiceView(dice: roll.dice),
                const Icon(Icons.close),
                Text(roll.count.toString()),
              ],
            ),
            Wrap(
              children: results,
            )
          ],
        ));
  }
}
