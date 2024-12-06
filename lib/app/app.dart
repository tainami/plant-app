import 'package:flutter/material.dart';
import 'package:plant/app/auth/screen/login_screen.dart';
import 'package:plant/app/auth/screen/register_screen.dart';
import 'package:plant/app/home/screen/home_screen.dart';
import 'package:plant/app/profile/profile_screen.dart';
import 'package:plant/app/splash/splash_screen.dart';
import 'package:plant/core/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plant App",
      theme: PlantThemeData.primary(),
      darkTheme: PlantThemeData.secondary(),
      themeMode: ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
        "/register": (context) => const RegisterScreen(),
        "/splash": (context) => const SplashScreen(),
        "/profile": (context) => const ProfileScreen(),
      },
    );
  }
}
