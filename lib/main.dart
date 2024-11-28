import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant/app/app.dart';
import 'package:plant/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const App());
}