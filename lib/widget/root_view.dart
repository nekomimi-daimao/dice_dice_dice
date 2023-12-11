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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const RollResult(),
            Icon(
              Icons.drag_handle,
              size: 60,
              color: Theme.of(context).colorScheme.onBackground,
            ),
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
      ),
      endDrawer: const SettingsDrawer(),
    );
  }
}
