import 'package:flutter/material.dart';
import 'package:plant/screens/home_screen.dart';
import 'package:plant/screens/login_screen.dart';
import 'package:plant/screens/profile_screen.dart';
import 'package:plant/screens/register_screen.dart';
import 'package:plant/screens/splash_screen.dart';

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
