import 'package:dice_dice_dice/widget/dice_selector.dart';
import 'package:dice_dice_dice/widget/grid_count.dart';
import 'package:dice_dice_dice/widget/roll_result.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootViewVertical extends HookConsumerWidget {
  const RootViewVertical({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const RollResult(),
          Card(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                const DiceSelector(),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.close,
                  size: 40,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                const GridCount(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
