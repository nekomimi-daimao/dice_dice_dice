import 'package:dice_dice_dice/widget/const_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dice_dice_dice/model/dice.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key, required this.dice});

  final Dice dice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: ConstWidgets.diceViewWidth,
        height: ConstWidgets.diceViewHeight,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dice.name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 0,
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dice.min.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Icon(Icons.switch_left),
                Text(
                  dice.max.toString(),
                  style: const TextStyle(
                    fontSize: 16,
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
