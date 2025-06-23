part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User? user; // Add this line to hold the user object
  AuthSuccess({this.user}); // Update constructor
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});
}
