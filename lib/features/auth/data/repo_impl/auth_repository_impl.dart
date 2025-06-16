import 'package:e_commerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient client;

  AuthRepositoryImpl(this.client);

  @override
  Future<void> signUp({required String email, required String password}) async {
    final response = await client.auth.signUp(email: email, password: password);
    if (response.user == null || response.user!.emailConfirmedAt == null) {
      throw Exception(
        response.session == null
            ? 'Sign up failed or email not confirmed'
            : 'Email confirmation pending',
      );
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    final response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user == null) {
      throw Exception('Login failed');
    }
  }
}
