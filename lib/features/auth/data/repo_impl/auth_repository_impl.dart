// In your auth_repository_impl.dart
import 'package:e_commerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient supabaseClient;

  AuthRepositoryImpl(this.supabaseClient);

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      // This call typically completes once the user is created and email is sent.
      // It does NOT wait for email confirmation by default.
      final AuthResponse response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
      );

      // You might want to check response.user or response.session here
      // but avoid checking user.emailConfirmedAt if you want immediate navigation.
      if (response.user == null) {
        // Handle cases where user is null even on apparent success (less common)
        throw AuthException('Sign up failed: User is null');
      }

      // If the API call itself was successful, the repository method should complete.
      // The BLoC will then receive this success and navigate.
    } on AuthException catch (e) {
      // Re-throw Supabase auth exceptions
      throw e;
    } catch (e) {
      // Handle other potential errors
      throw Exception(
        'An unexpected error occurred during sign up: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      final AuthResponse response = await supabaseClient.auth
          .signInWithPassword(email: email, password: password);

      if (response.user == null) {
        // This case might indicate an issue even if no AuthException was thrown,
        // e.g., if the user is not confirmed and your Supabase settings prevent login.
        throw AuthException(
          'Login failed: User is null or session not established.',
        );
      }
      // Login successful, Supabase client handles the session.
    } on AuthException catch (e) {
      // Re-throw Supabase auth exceptions to be caught by the BLoC
      throw AuthException(e.message);
    } catch (e) {
      throw Exception(
        'An unexpected error occurred during login: ${e.toString()}',
      );
    }
  }
}
