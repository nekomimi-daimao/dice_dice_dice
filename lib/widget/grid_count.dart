import 'package:dice_dice_dice/provider/roll_dice.dart';
import 'package:dice_dice_dice/provider/selected_dice.dart';
import 'package:dice_dice_dice/widget/const_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GridCount extends ConsumerWidget {
  const GridCount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: 260,
        height: 300,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                shape: CircleBorder(
                  side: BorderSide(
                    width: ConstWidgets.borderWidth,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
              onPressed: () {
                ref
                    .read(rollDiceProvider.notifier)
                    .doRoll(ref.read(selectedDiceProvider), index + 1);
              },
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onTertiaryContainer),
              ),
            );
          },
        ));
  }
}
