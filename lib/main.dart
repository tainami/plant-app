import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant/app/app.dart';
import 'package:plant/core/di/di.dart';
import 'package:plant/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDependencies();
  runApp(const App());
}
