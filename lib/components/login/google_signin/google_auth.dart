import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:playbook/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabaseAuth;

class GoogleAuth {
  Future<void> signInWithGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn(
      clientId: Platform.isAndroid
          ? SupabaseConfig.iosClientId
          : SupabaseConfig.iosClientId,
      serverClientId: SupabaseConfig.webClientId,
    );

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      print("User cancelled");
      return;
    }

    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      throw Exception('Missing Google access token or ID token');
    }

    final supabase = supabaseAuth.Supabase.instance.client;

    try {
      final response = await supabase.auth.signInWithIdToken(
        provider: supabaseAuth.OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      final user = response.user;
      if (user != null) {
        print('✅ Signed in! User email: ${user.email}');
        // AuthGate will automatically handle navigation based on auth state
      }
    } on supabaseAuth.AuthException catch (e) {
      print('❌ Supabase Auth Error: ${e.message}');
    } catch (e) {
      print('⚠️ Unknown error during sign-in: $e');
    }
  }
}
