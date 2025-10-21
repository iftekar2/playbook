import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/nfl_in_home_screen.dart';
import 'package:playbook/components/home/sports_options.dart';
import 'package:playbook/components/login/email_login/auth_service.dart';

class HomePage extends StatefulWidget {
  final Function(String)? onSportSelected;

  const HomePage({super.key, this.onSportSelected});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Get auth service
  final authService = AuthService();

  // Logout button pressed
  void _logout() async {
    await authService.signOut();
  }

  // Handle sport selection
  void _onSportSelected(String sport) {
    print('Selected sport: $sport');
    // Call the parent callback if provided
    widget.onSportSelected?.call(sport);
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
            color: Color.fromRGBO(68, 59, 59, 1),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SportsOptions(onSportSelected: _onSportSelected),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [NflInHomeScreen()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
