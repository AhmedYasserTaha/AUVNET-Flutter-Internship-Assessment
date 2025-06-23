import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:e_commerce_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // Inject UseCases for sign-up and login operations
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;
  final UpdateAvatarUseCase updateAvatarUseCase;

  AuthBloc(
    this.updateAvatarUseCase, {
    required this.signUpUseCase,
    required this.loginUseCase,
  }) : super(AuthInitial()) {
    // Handler for SignUpRequested event
    on<SignUpRequested>((event, emit) async {
      // Emit AuthLoading state to inform the UI that the process has started
      emit(AuthLoading());
      try {
        // Call SignUpUseCase, passing email and password
        final user = await signUpUseCase.call(
          email: event.email,
          password: event.password,
          name: event.name,
        );
        // If successful, emit AuthSuccess state
        emit(AuthSuccess(user: user));
      } catch (e) {
        // If an error occurs, emit AuthFailure state with the error message
        emit(AuthFailure(message: e.toString()));
      }
    });

    // Handler for SignInRequested event
    on<SignInRequested>((event, emit) async {
      // Emit AuthLoading state
      emit(AuthLoading());
      try {
        // Call LoginUseCase, passing email and password
        final user = await loginUseCase.call(
          email: event.email,
          password: event.password,
        );
        // If successful, emit AuthSuccess state
        emit(AuthSuccess(user: user));
      } catch (e) {
        // If an error occurs, emit AuthFailure state with the error message
        emit(AuthFailure(message: e.toString()));
      }
    });

    on<AvatarUpdateRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await updateAvatarUseCase.call(image: event.image);
        emit(AuthSuccess(user: user));
      } catch (e) {
        emit(AuthFailure(message: e.toString()));
      }
    });
  }
}
