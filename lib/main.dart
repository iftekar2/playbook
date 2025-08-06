import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:playbook/Pages/LoginPage.dart';
import 'package:playbook/Pages/SignupPage.dart';
import 'package:playbook/Pages/forgotPassword.dart';
import 'package:playbook/Pages/homePage.dart';
import 'package:playbook/Pages/welcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      routes: {
        "/home": (context) => Homepage(),
        "/welcome": (context) => Welcomepage(),
        "/login": (context) => Loginpage(),
        "/signup": (context) => SignupPage(),
        "/forgotPassword": (context) => Forgotpassword(),
      },
    );
  }
}
