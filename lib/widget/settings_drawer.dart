import 'package:dice_dice_dice/model/app_settings.dart';
import 'package:dice_dice_dice/provider/current_app_settings.dart';
import 'package:dice_dice_dice/provider/package_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsDrawer extends HookConsumerWidget {
  const SettingsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.read(packageInfoProvider).value;
    final settings = ref.watch(currentAppSettingsProvider);
    // https://stackoverflow.com/a/76564116
    const String releasePath = kDebugMode ? '' : 'assets/';

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
          const Divider(
            height: 20,
            thickness: 4,
          ),
          ListTile(
            title: const Text("Share",
                textAlign: TextAlign.center,
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    )),
            subtitle: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Image.network(
                    '${releasePath}assets/images/qr.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const Text(
                  "https://nekomimi-daimao.github.io/dice_dice_dice/",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            // subtitle: Icon(Icons.info_outline_rounded),
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
