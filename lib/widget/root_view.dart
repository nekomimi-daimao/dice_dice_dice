import 'package:dice_dice_dice/provider/roll_dice.dart';
import 'package:dice_dice_dice/widget/roll_result.dart';
import 'package:dice_dice_dice/widget/settings_drawer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dice_selector.dart';
import 'grid_count.dart';

class RootView extends HookConsumerWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roll = ref.watch(rollDiceProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("d3"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RollResult(roll: roll),
            const DiceSelector(),
            const GridCount(),
          ],
        ),
      ),
      endDrawer: const SettingsDrawer(),
    );
  }
}
