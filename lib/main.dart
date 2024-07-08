import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/src/features/authentication/screens/login/login_screen.dart';
// import 'package:inventory/src/features/authentication/screens/onboarding_screen/onboarding_screen.dart';
// import 'package:inventory/src/features/authentication/screens/splash_screen/splash_screen.dart';
// import 'package:inventory/src/features/authentication/screens/welcome/welcome.dart';
import 'package:inventory/src/utils/theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://bxcsazxrgkrslbqeworx.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ4Y3NhenhyZ2tyc2xicWV3b3J4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk3NDQyODMsImV4cCI6MjAzNTMyMDI4M30.NcvtPsa_FC_3ozm4G43pDrY8XtO2zhtM2RVW1WFOy78');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: CAppTheme.lightTheme,
        darkTheme: CAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const LoginScreen());
  }
}
