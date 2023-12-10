import 'package:dice_dice_dice/provider/roll_dice.dart';
import 'package:dice_dice_dice/widget/roll_result.dart';
import 'package:dice_dice_dice/widget/roll_view.dart';
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
        title: const Text("d3"),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RollResult(),
            SizedBox(
              width: 20,
            ),
            DiceSelector(),
            SizedBox(
              width: 20,
            ),
            GridCount(),
          ],
        ),
      ),
      endDrawer: const SettingsDrawer(),
    );
  }
}
