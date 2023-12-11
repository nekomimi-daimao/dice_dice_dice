import 'package:dice_dice_dice/widget/const_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dice_dice_dice/model/dice.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key, required this.dice});

  final Dice dice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
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
                fontSize: 20,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
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
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                Icon(
                  Icons.switch_left,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                Text(
                  dice.max.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
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
