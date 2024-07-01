import 'package:flutter/material.dart';
import 'package:inventory/src/features/authentication/screens/onboarding_screen/onboarding_screen.dart';
// import 'package:inventory/src/features/authentication/screens/splash_screen/splash_screen.dart';
// import 'package:inventory/src/features/authentication/screens/welcome/welcome.dart';
import 'package:inventory/src/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: CAppTheme.lightTheme,
        darkTheme: CAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: OnBoardingScreen());
  }
}
