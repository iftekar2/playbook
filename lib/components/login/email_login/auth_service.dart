import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in with email and password3
  Future<AuthResponse> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // Sign up with email and password
  Future<AuthResponse> signUpWithEmailPassword(
    String email,
    String password, {
    String? firstName,
    String? lastName,
  }) async {
    // Prepare user data for signup
    Map<String, dynamic>? userData;
    if (firstName != null && lastName != null) {
      final fullName = '$firstName $lastName';
      userData = {
        'display_name': fullName,
        'first_name': firstName,
        'last_name': lastName,
      };
    }

    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      data: userData,
    );

    return response;
  }

  // Sign out
  Future<void> signOut() async {
    return await _supabase.auth.signOut();
  }

  // Get user data
  String? getUserData() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
