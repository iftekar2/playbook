import 'package:flutter/material.dart';
import 'package:playbook/Pages/homePage.dart';
import 'package:playbook/Pages/welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Playbook',
      home: Welcomepage(),
    );
  }
}
