import 'package:dice_dice_dice/widget/dice_view.dart';
import 'package:flutter/material.dart';
import 'package:dice_dice_dice/model/roll.dart';

class RollView extends StatelessWidget {
  const RollView({super.key, required this.roll});

  final Roll roll;

  @override
  Widget build(BuildContext context) {
    List<Widget> results = [];
    results.addAll(roll.result.map((e) => Text(e.toString())));

    return Container(
        width: 200,
        constraints: const BoxConstraints(minHeight: 200),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(roll.sum().toString()),
            Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  children: results,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DiceView(dice: roll.dice),
                const Icon(Icons.close),
                Text(roll.count.toString()),
              ],
            ),
          ],
        ));
  }
}
