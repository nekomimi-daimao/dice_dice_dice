import 'package:dice_dice_dice/widget/const_widgets.dart';
import 'package:dice_dice_dice/widget/root/root_view_horizontal.dart';
import 'package:dice_dice_dice/widget/root/root_view_vertical.dart';
import 'package:dice_dice_dice/widget/settings_drawer.dart';
import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth > ConstWidgets.verticalWidth
            ? const RootViewHorizontal()
            : const RootViewVertical();
      }),
      endDrawer: const SettingsDrawer(),
    );
  }
}
