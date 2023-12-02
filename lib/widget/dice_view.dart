import 'package:dice_dice_dice/widget/const_widgets.dart';
import 'package:flutter/material.dart';

import '../model/dice.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key, required this.dice});

  final Dice dice;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ConstWidgets.diceViewWidth,
        height: ConstWidgets.diceViewHeight,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dice.name),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(dice.min.toString()),
                const Icon(Icons.switch_left),
                Text(dice.max.toString()),
              ],
            )
          ],
        ));
  }
}
