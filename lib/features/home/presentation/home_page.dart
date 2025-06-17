import 'package:e_commerce_app/core/usecases/get_best_orders_use_case.dart';
import 'package:e_commerce_app/core/usecases/get_popular_items_use_case.dart';
import 'package:e_commerce_app/features/home/data/repositories/best_order_repo.dart';
import 'package:e_commerce_app/features/home/data/repositories/popular_repo.dart';
import 'package:e_commerce_app/features/home/data/repositories/services_repo.dart';
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
        // Provide ServicesBloc, injecting ServicesRepo
        // `..add(LoadServicesEvent())` to dispatch the load services event immediately after BLoC creation
        BlocProvider(
          create: (_) => ServicesBloc(ServicesRepo())..add(LoadServicesEvent()),
        ),
        // Provide BestOrderBloc, injecting GetBestOrdersUseCase (which in turn injects BestOrderRepo)
        // `..add(LoadBestOrdersEvent())` to dispatch the load best orders event immediately
        BlocProvider(
          create:
              (_) =>
                  BestOrderBloc(GetBestOrdersUseCase(BestOrderRepo()))
                    ..add(LoadBestOrdersEvent()),
        ),
        // Provide PopularBloc, injecting GetPopularItemsUseCase (which in turn injects PopularRepo)
        // `..add(LoadPopularItemsEvent())` to dispatch the load popular items event immediately
        BlocProvider(
          create:
              (_) =>
                  PopularBloc(GetPopularItemsUseCase(PopularRepo()))
                    ..add(LoadPopularItemsEvent()),
        ),
      ],
      // The main UI widget that will benefit from these BLoCs
      child: const HomePageBody(),
    );
  }
}
