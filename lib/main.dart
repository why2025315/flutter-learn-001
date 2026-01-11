import 'package:flutter/material.dart';
import 'package:flutter_demo001/data/notifiers.dart';
import 'package:flutter_demo001/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  void initThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? themeMode = prefs.getBool(KConstants.themeModeKey);
    print('initThemeMode $themeMode');
    brightnessNotifier.value = themeMode ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: brightnessNotifier,
      builder: (context, brightness, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.tealAccent,
              brightness: brightness ? Brightness.light : Brightness.dark,
            ),
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}
