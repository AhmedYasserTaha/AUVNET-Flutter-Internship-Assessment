import 'package:e_commerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User?> call({required String email, required String password}) async {
    return await repository.login(email: email, password: password);
  }
}
