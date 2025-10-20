import 'package:flutter/material.dart';
import 'package:playbook/components/home_page.dart';
import 'package:playbook/components/welcome_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Unauthenticated --> Login Page
// Authenticated --> Home Page
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Listen to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        // Check if there is a valid session
        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          return HomePage(key: ValueKey('home_${session.user.id}'));
        } else {
          return WelcomePage();
        }
      },
    );
  }
}
