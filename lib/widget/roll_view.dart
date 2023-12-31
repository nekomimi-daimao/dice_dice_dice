import 'package:dice_dice_dice/provider/current_app_settings.dart';
import 'package:dice_dice_dice/widget/const_widgets.dart';
import 'package:dice_dice_dice/widget/dice_view.dart';
import 'package:flutter/material.dart';
import 'package:dice_dice_dice/model/roll.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RollView extends HookConsumerWidget {
  const RollView({super.key, required this.roll});

  final Roll roll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var result = roll.result;
    var sort =
        ref.watch(currentAppSettingsProvider.select((v) => v.sortResult));
    if (sort) {
      result.sort();
      result = result.reversed.toList();
    }

    return SelectionArea(
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Container(
          width: ConstWidgets.rollViewWidth,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: const CircleBorder(),
                color: Theme.of(context).colorScheme.primary,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  width: ConstWidgets.rollResultWidth,
                  height: ConstWidgets.rollResultHeight,
                  alignment: Alignment.center,
                  child: Text(
                    roll.sum().toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints(maxHeight: 70),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    children: result
                        .map(
                          (e) => Text(
                            "$e, ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
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
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  DiceView(dice: roll.dice),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
