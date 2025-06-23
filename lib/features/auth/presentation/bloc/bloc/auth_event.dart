part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;

  SignUpRequested({
    required this.email,
    required this.password,
    required this.name,
  });
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested({required this.email, required this.password});
}

class AvatarUpdateRequested extends AuthEvent {
  final File image;

  AvatarUpdateRequested({required this.image});
}
