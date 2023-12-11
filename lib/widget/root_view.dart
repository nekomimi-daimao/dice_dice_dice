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
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          "d3",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RollResult(),
            SizedBox(
              width: 20,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: DiceSelector(),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Card(
              child: GridCount(),
            ),
          ],
        ),
      ),
      endDrawer: const SettingsDrawer(),
    );
  }
}
