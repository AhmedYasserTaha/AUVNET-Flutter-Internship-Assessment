import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/usecases/login_usecase.dart';
import 'package:e_commerce_app/core/usecases/sign_up_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc({required this.signUpUseCase, required this.loginUseCase})
    : super(AuthInitial()) {
    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await signUpUseCase.call(email: event.email, password: event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(message: e.toString()));
      }
    });

    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await loginUseCase.call(email: event.email, password: event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(message: e.toString()));
      }
    });
  }
}
