import 'package:dice_dice_dice/provider/roll_dice.dart';
import 'package:dice_dice_dice/provider/selected_dice.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GridCount extends ConsumerWidget {
  const GridCount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: 300,
        height: 300,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 4,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              onPressed: () {
                ref
                    .read(rollDiceProvider.notifier)
                    .doRoll(ref.read(selectedDiceProvider), index + 1);
              },
              child: Text(
                (index + 1).toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ));
  }
}
