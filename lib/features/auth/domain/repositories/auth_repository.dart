import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<User?> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<User?> login({required String email, required String password});
  Future<User?> updateAvatar({required File image});
  User? getCurrentUser();
}
