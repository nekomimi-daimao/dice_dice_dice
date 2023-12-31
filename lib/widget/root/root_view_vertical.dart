import 'package:dice_dice_dice/widget/dice_selector.dart';
import 'package:dice_dice_dice/widget/grid_count.dart';
import 'package:dice_dice_dice/widget/roll_result.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootViewVertical extends HookConsumerWidget {
  const RootViewVertical({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RollResult(),
        Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 10,
              ),
              DiceSelector(),
              SizedBox(
                width: 10,
              ),
              GridCount(),
            ],
          ),
        ),
      ],
    );
  }
}
