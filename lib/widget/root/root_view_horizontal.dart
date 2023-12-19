import 'package:dice_dice_dice/widget/dice_selector.dart';
import 'package:dice_dice_dice/widget/grid_count.dart';
import 'package:dice_dice_dice/widget/roll_result.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootViewHorizontal extends HookConsumerWidget {
  const RootViewHorizontal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const RollResult(),
        Icon(
          Icons.drag_handle,
          size: 60.h,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10.w,
              ),
              const DiceSelector(),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.close,
                size: 40.w,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              const GridCount(),
            ],
          ),
        ),
      ],
    );
  }
}
