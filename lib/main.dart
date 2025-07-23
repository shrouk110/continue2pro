import 'package:flutter/material.dart';
import 'package:flutter_application_10/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const WelcomeScreen());
  }
}
