import 'package:flutter/material.dart';

class AppSettings {
  final bool playAnimation;
  final bool playSound;
  final bool sortResult;
  final ThemeMode themeMode;

  AppSettings(
      {required this.playAnimation,
      required this.playSound,
      required this.sortResult,
      required this.themeMode});

  static const String keyPlayAnimation = "keyPlayAnimation";
  static const String keyPlaySound = "keyPlaySound";
  static const String keySortResult = "keySortResult";
  static const String keyThemeMode = "keyThemeMode";

  AppSettings copyWith(
      {bool? playAnimation,
      bool? playSound,
      bool? sortResult,
      ThemeMode? themeMode}) {
    return AppSettings(
      playAnimation: playAnimation ?? this.playAnimation,
      playSound: playSound ?? this.playSound,
      sortResult: sortResult ?? this.sortResult,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
