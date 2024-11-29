import 'package:flutter/material.dart';
import 'package:plant/app/home/screen/home_screen.dart';
import 'package:plant/app/auth/login_screen.dart';
import 'package:plant/app/profile/profile_screen.dart';
import 'package:plant/app/auth/register_screen.dart';
import 'package:plant/app/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plant App",
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/splash": (context) => const SplashScreen(),
        "/profile": (context) => const ProfileScreen(),
      },
    );
  }
}
