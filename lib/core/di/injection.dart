import 'package:e_commerce_app/features/home/domain/usecases/get_popular_items_use_case.dart';
import 'package:e_commerce_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:e_commerce_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:e_commerce_app/features/home/data/repositories/best_order_repository_impl.dart';
import 'package:e_commerce_app/features/home/data/repositories/popular_repository_impl.dart';
import 'package:e_commerce_app/features/home/data/repositories/services_repository_impl.dart';
import 'package:e_commerce_app/features/home/domain/repositories/best_order_repo.dart';
import 'package:e_commerce_app/features/home/domain/repositories/popular_repo.dart';
import 'package:e_commerce_app/features/home/domain/repositories/services_repo.dart';
import 'package:e_commerce_app/features/home/domain/usecases/get_best_orders_usecase.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/best_order_bloc/best_order_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/services_order_bloc/services_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:e_commerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_commerce_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ✅ Bloc
  sl.registerFactory(() => BestOrderBloc(GetBestOrdersUseCase(sl())));

  sl.registerLazySingleton<BestOrderRepository>(
    () => BestOrderRepositoryImpl(Supabase.instance.client),
  );
  sl.registerLazySingleton(() => GetBestOrdersUseCase(sl()));
  // ✅ Supabase Client
  final supabase = Supabase.instance.client;

  // ✅ Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(supabase));

  // ✅ UseCases
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl())); // ✅ Add this

  // ✅ Bloc
  sl.registerFactory(() => AuthBloc(signUpUseCase: sl(), loginUseCase: sl()));
  // 🟦 Services
  sl.registerLazySingleton<ServicesRepo>(
    () => ServicesRepositoryImpl(Supabase.instance.client),
  ); // أو لو فيه Impl اعملها
  sl.registerFactory(() => ServicesBloc(sl()));

  // 🟪 Popular
  sl.registerLazySingleton<PopularRepo>(
    () => PopularRepositoryImpl(Supabase.instance.client),
  );
  sl.registerFactory(() => PopularBloc(GetPopularItemsUseCase(sl())));
  // أو لو فيه Impl اعملها
  sl.registerLazySingleton(() => GetPopularItemsUseCase(sl()));
  sl.registerFactory(() => PopularBloc(sl()));
}
