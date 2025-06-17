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
  Future<void> login({required String email, required String password}) {
    // ... login implementation
    throw UnimplementedError();
  }
}
