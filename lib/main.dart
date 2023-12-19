import 'package:dice_dice_dice/provider/current_app_settings.dart';
import 'package:dice_dice_dice/provider/shared_preference.dart';
import 'package:dice_dice_dice/widget/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
    child: const ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(600, 600),
      child: MyApp(),
    ),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode =
        ref.watch(currentAppSettingsProvider.select((v) => v.themeMode));

    return MaterialApp(
      title: 'Dice Dice Dice',
      theme: ThemeData(
        colorSchemeSeed: Colors.cyan,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.cyan,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: themeMode,
      home: const RootView(),
    );
  }
}
