import 'package:e_commerce_app/features/auth/data/repo_impl/auth_repository_impl.dart';
import 'package:e_commerce_app/core/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:e_commerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_commerce_app/core/usecases/sign_up_usecase.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ✅ Supabase Client
  final supabase = Supabase.instance.client;

  // ✅ Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(supabase));

  // ✅ UseCases
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl())); // ✅ Add this

  // ✅ Bloc
  sl.registerFactory(() => AuthBloc(signUpUseCase: sl(), loginUseCase: sl()));
}
