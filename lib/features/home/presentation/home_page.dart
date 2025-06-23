import 'package:e_commerce_app/core/di/injection.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';

import 'package:e_commerce_app/features/home/presentation/bloc/best_order_bloc/best_order_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/best_order_bloc/best_order_event.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/popular_bloc/popular_event.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/services_order_bloc/services_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/services_order_bloc/services_event.dart';
import 'package:e_commerce_app/features/home/presentation/home_page_arguments.dart';
import 'package:e_commerce_app/features/home/presentation/widget/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final HomePageArguments? args;
  const HomePage({super.key, this.args});
  @override
  Widget build(BuildContext context) {
    // Use MultiBlocProvider to provide multiple BLoCs to the widget subtree (HomePageBody)
    return BlocProvider<AuthBloc>(
      create: (context) => sl<AuthBloc>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<ServicesBloc>()..add(LoadServicesEvent()),
          ),
          BlocProvider(
            create: (_) => sl<BestOrderBloc>()..add(LoadBestOrdersEvent()),
          ),
          BlocProvider(
            create: (_) => sl<PopularBloc>()..add(LoadPopularItemsEvent()),
          ),
        ],
        child: HomePageBody(
          userName: args?.userName,
          avatarUrl: args?.avatarUrl,
        ),
      ),
    );

    // The main UI widget that will benefit from these BLoCs
  }
}
