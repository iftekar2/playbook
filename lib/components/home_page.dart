import 'package:flutter/material.dart';
import 'package:playbook/components/login/email_login/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Get auth service
  final authService = AuthService();

  // Logout button pressed
  void _logout() async {
    await authService.signOut();
    // AuthGate will automatically handle navigation based on auth state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Playbook",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: _logout,
            icon: Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),

      backgroundColor: Colors.white,
      body: Center(child: Text("Home Page")),
    );
  }
}
