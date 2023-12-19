import 'package:dice_dice_dice/widget/const_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dice_dice_dice/model/dice.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key, required this.dice});

  final Dice dice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: Container(
        width: ConstWidgets.diceViewWidth,
        height: ConstWidgets.diceViewHeight,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dice.name,
              style: TextStyle(
                fontSize: 20.sp,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
            ),
            SizedBox(
              width: 0,
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dice.min.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
                Icon(
                  Icons.switch_left,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
                Text(
                  dice.max.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
