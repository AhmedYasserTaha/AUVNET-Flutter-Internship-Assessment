import 'package:e_commerce_app/core/di/injection.dart';

import 'package:e_commerce_app/features/home/presentation/bloc/best_order_bloc/best_order_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/best_order_bloc/best_order_event.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/popular_bloc/popular_event.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/services_order_bloc/services_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/services_order_bloc/services_event.dart';
import 'package:e_commerce_app/features/home/presentation/widget/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MultiBlocProvider to provide multiple BLoCs to the widget subtree (HomePageBody)
    return MultiBlocProvider(
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
      child: const HomePageBody(),
    );

    // The main UI widget that will benefit from these BLoCs
  }
}
