import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:playbook/Pages/Login/LoginPage.dart';
import 'package:playbook/Pages/Login/SignupPage.dart';
import 'package:playbook/Pages/Login/forgotPassword.dart';
import 'package:playbook/Pages/homePage.dart';
import 'package:playbook/Pages/welcomePage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Supabase setup
  await Supabase.initialize(
    url: "https://euosqjzglxktrlygdqgc.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1b3NxanpnbHhrdHJseWdkcWdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ3OTQyNzUsImV4cCI6MjA3MDM3MDI3NX0.0vuKu_yDvfy6O08Hg7TleGW38z4HH1agZewaGjhhn7A",
  );

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
      home: Homepage(),
      // home: Welcomepage(),
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
