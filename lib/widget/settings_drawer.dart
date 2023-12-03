import 'package:dice_dice_dice/provider/package_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsDrawer extends HookConsumerWidget {
  const SettingsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.read(packageInfoProvider).value;

    return Drawer(
      child: ListView(
        children: [
          ListTile(
              title: Text(
            "Setting",
            textAlign: TextAlign.center,
          )),
          AboutListTile(
            icon: const Icon(Icons.info_outline_rounded),
            applicationName: packageInfo?.appName,
            applicationVersion: packageInfo?.version,
            applicationLegalese: '2023 NekomimiDaimao',
          )
        ],
      ),
    );
  }
}
