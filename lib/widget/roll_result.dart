import 'package:dice_dice_dice/provider/current_app_settings.dart';
import 'package:dice_dice_dice/provider/roll_dice.dart';
import 'package:dice_dice_dice/widget/roll_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RollResult extends StatefulHookConsumerWidget {
  const RollResult({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return RollResultState();
  }
}

class RollResultState extends ConsumerState<RollResult>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<Alignment> animation;
  static const Alignment highest = Alignment(0, -3);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    var tweenSequence = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.center, end: highest)
              .chain((CurveTween(curve: Curves.linear))),
          weight: 20),
      TweenSequenceItem(
          tween: Tween(begin: highest, end: Alignment.center)
              .chain((CurveTween(curve: Curves.bounceOut))),
          weight: 80),
    ]);
    animation = controller.drive(tweenSequence);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final roll = ref.watch(rollDiceProvider);

    ref.listen(rollDiceProvider, (previous, next) {
      if (!ref.read(currentAppSettingsProvider).playAnimation) {
        return;
      }
      if (controller.isAnimating) {
        return;
      }
      controller.reset();
      controller.forward();
    });

    return AlignTransition(
      alignment: animation,
      child: RollView(
        roll: roll,
      ),
    );
  }
}
