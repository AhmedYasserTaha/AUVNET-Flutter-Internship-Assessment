// In your auth_repository_impl.dart
import 'dart:io';

import 'package:e_commerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient supabaseClient;

  AuthRepositoryImpl(this.supabaseClient);

  @override
  Future<User?> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // This call typically completes once the user is created and email is sent.
      // It does NOT wait for email confirmation by default.
      final AuthResponse response = await supabaseClient.auth.signUp(
        email: email,

        password: password,
        data: {'display_name': name},
      );

      // You might want to check response.user or response.session here
      // but avoid checking user.emailConfirmedAt if you want immediate navigation.
      if (response.user == null) {
        // Handle cases where user is null even on apparent success (less common)
        throw AuthException('Sign up failed: User is null');
      } else {
        return response.user;
      }

      // If the API call itself was successful, the repository method should complete.
      // The BLoC will then receive this success and navigate.
    } on AuthException catch (e) {
      // Re-throw Supabase auth exceptions
      rethrow;
    } catch (e) {
      // Handle other potential errors
      throw Exception(
        'An unexpected error occurred during sign up: ${e.toString()}',
      );
    }
  }

  @override
  Future<User?> login({required String email, required String password}) async {
    // Change return type to User?
    try {
      final AuthResponse response = await supabaseClient.auth
          .signInWithPassword(email: email, password: password);

      if (response.user == null) {
        // This case might indicate an issue even if no AuthException was thrown,
        // e.g., if the user is not confirmed and your Supabase settings prevent login.
        throw AuthException(
          'Login failed: User is null or session not established.',
        );
      } else {
        return response.user;
      }
      // Login successful, Supabase client handles the session.
    } on AuthException catch (e) {
      // Re-throw Supabase auth exceptions to be caught by the BLoC
      rethrow;
    } catch (e) {
      throw Exception(
        'An unexpected error occurred during login: ${e.toString()}',
      );
    }
  }

  @override
  Future<User?> updateAvatar({required File image}) async {
    try {
      final user = await supabaseClient.auth.currentUser;
      if (user == null) {
        throw AuthException('User not authenticated');
      }
      final imageExtension = image.path.split('.').last.toLowerCase();
      final imagePath = '${user.id}/avatar.$imageExtension';
      await supabaseClient.storage
          .from('avatars')
          .upload(
            imagePath,
            image,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: true),
          );
      final imageUrl = supabaseClient.storage
          .from('avatars')
          .getPublicUrl(imagePath);
      final response = await supabaseClient.auth.updateUser(
        UserAttributes(data: {'avatar_url': imageUrl}),
      );
      return response.user;
    } catch (e) {
      throw Exception(
        'An unexpected error occurred during avatar update: ${e.toString()}',
      );
    }
  }

  @override
  User? getCurrentUser() {
    return Supabase.instance.client.auth.currentUser;
  }
}
