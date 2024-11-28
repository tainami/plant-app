import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    firestore.collection("users").get().then((value) {
      final user = value.docs.first.data();
      print(user["name"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
