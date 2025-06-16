import 'package:e_commerce_app/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<void> call({required String email, required String password}) async {
    return await repository.signUp(email: email, password: password);
  }
}
