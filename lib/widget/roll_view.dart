import 'package:dice_dice_dice/widget/const_widgets.dart';
import 'package:dice_dice_dice/widget/dice_view.dart';
import 'package:flutter/material.dart';
import 'package:dice_dice_dice/model/roll.dart';

class RollView extends StatelessWidget {
  const RollView({super.key, required this.roll});

  final Roll roll;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: ConstWidgets.rollViewWidth,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  roll.sum().toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  children: roll.result
                      .map(
                        (e) => Text(
                          "$e, ",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  roll.count.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Icon(Icons.close),
                DiceView(dice: roll.dice),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
