import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/usecases/login_usecase.dart';
import 'package:e_commerce_app/core/usecases/sign_up_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // Inject UseCases for sign-up and login operations
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc({required this.signUpUseCase, required this.loginUseCase})
    : super(AuthInitial()) {
    // Handler for SignUpRequested event
    on<SignUpRequested>((event, emit) async {
      // Emit AuthLoading state to inform the UI that the process has started
      emit(AuthLoading());
      try {
        // Call SignUpUseCase, passing email and password
        await signUpUseCase.call(email: event.email, password: event.password);
        // If successful, emit AuthSuccess state
        emit(AuthSuccess());
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
        await loginUseCase.call(email: event.email, password: event.password);
        // If successful, emit AuthSuccess state
        emit(AuthSuccess());
      } catch (e) {
        // If an error occurs, emit AuthFailure state with the error message
        emit(AuthFailure(message: e.toString()));
      }
    });
  }
}
