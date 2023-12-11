import 'package:dice_dice_dice/model/app_settings.dart';
import 'package:dice_dice_dice/provider/current_app_settings.dart';
import 'package:dice_dice_dice/provider/package_info.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsDrawer extends HookConsumerWidget {
  const SettingsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.read(packageInfoProvider).value;
    final settings = ref.watch(currentAppSettingsProvider);

    return Drawer(
      child: ListView(
        children: [
          const ListTile(
              title: Text(
            "Setting",
            textAlign: TextAlign.center,
          )),
          SwitchListTile(
            title: const Text("Play Animation"),
            value: settings.playAnimation,
            onChanged: (v) {
              ref
                  .read(currentAppSettingsProvider.notifier)
                  .update(settings.copyWith(playAnimation: v));
            },
          ),
          SwitchListTile(
              title: const Text("Play Sound"),
              value: settings.playSound,
              onChanged: (v) {
                ref
                    .read(currentAppSettingsProvider.notifier)
                    .update(settings.copyWith(playSound: v));
              }),
          SwitchListTile(
              title: const Text("Sort Result"),
              value: settings.sortResult,
              onChanged: (v) {
                ref
                    .read(currentAppSettingsProvider.notifier)
                    .update(settings.copyWith(sortResult: v));
              }),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _selectThemeButton(
                    ThemeMode.system, settings.themeMode, settings, ref),
                const Spacer(),
                _selectThemeButton(
                    ThemeMode.light, settings.themeMode, settings, ref),
                const Spacer(),
                _selectThemeButton(
                    ThemeMode.dark, settings.themeMode, settings, ref),
              ],
            ),
          ),
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

  ElevatedButton _selectThemeButton(ThemeMode correspond, ThemeMode current,
      AppSettings settings, WidgetRef ref) {
    final bool selected = correspond == current;
    return ElevatedButton(
      onPressed: selected
          ? null
          : (() {
              ref
                  .read(currentAppSettingsProvider.notifier)
                  .update(settings.copyWith(themeMode: correspond));
            }),
      child: Text(
        correspond.name,
      ),
    );
  }
}
