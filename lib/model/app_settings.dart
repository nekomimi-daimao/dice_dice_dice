class AppSettings {
  final bool playAnimation;
  final bool playSound;

  AppSettings({required this.playAnimation, required this.playSound});

  static const String keyPlayAnimation = "keyPlayAnimation";
  static const String keyPlaySound = "keyPlaySound";

  AppSettings copyWith({bool? playAnimation, bool? playSound}) {
    return AppSettings(
        playAnimation: playAnimation ?? this.playAnimation,
        playSound: playSound ?? this.playSound);
  }

  @override
  String toString() {
    return 'AppSettings{playAnimation: $playAnimation, playSound: $playSound}';
  }
}
