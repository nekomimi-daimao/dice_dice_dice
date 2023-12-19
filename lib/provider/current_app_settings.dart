import 'package:dice_dice_dice/model/app_settings.dart';
import 'package:dice_dice_dice/provider/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_app_settings.g.dart';

@Riverpod(keepAlive: true)
class CurrentAppSettings extends _$CurrentAppSettings {
  @override
  AppSettings build() {
    var prefs = ref.read(sharedPreferencesProvider);
    return AppSettings(
        playAnimation: prefs.getBool(AppSettings.keyPlayAnimation) ?? true,
        playSound: prefs.getBool(AppSettings.keyPlaySound) ?? true,
        sortResult: prefs.getBool(AppSettings.keySortResult) ?? true,
        themeMode: ThemeMode.values.byName(
            prefs.getString(AppSettings.keyThemeMode) ??
                ThemeMode.system.name));
  }

  void update(AppSettings settings) {
    state = settings;
  }

  Future<void> save() async {
    var prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(AppSettings.keyPlayAnimation, state.playAnimation);
    await prefs.setBool(AppSettings.keyPlaySound, state.playSound);
    await prefs.setBool(AppSettings.keySortResult, state.sortResult);
    await prefs.setString(AppSettings.keyThemeMode, state.themeMode.name);
  }
}
