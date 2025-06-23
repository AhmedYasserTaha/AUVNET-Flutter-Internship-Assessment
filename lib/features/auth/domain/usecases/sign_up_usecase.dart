import 'dart:io';

import 'package:e_commerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<User?> call({
    // Change return type to User?
    required String email,
    required String password,
    required String name,
  }) async {
    return await repository.signUp(
      email: email,
      password: password,
      name: name,
    );
  }
}

class UpdateAvatarUseCase {
  final AuthRepository repository;

  UpdateAvatarUseCase(this.repository);

  Future<User?> call({required File image}) async {
    return await repository.updateAvatar(image: image);
  }
}
