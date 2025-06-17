import 'package:e_commerce_app/core/usecases/get_best_orders_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/best_order_bloc/best_order_event.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/best_order_bloc/best_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestOrderBloc extends Bloc<BestOrderEvent, BestOrderState> {
  final GetBestOrdersUseCase getBestOrdersUseCase;

  BestOrderBloc(this.getBestOrdersUseCase) : super(BestOrderInitial()) {
    on<LoadBestOrdersEvent>((event, emit) async {
      emit(BestOrderLoading());
      try {
        final images = await getBestOrdersUseCase();
        emit(BestOrderLoaded(images));
      } catch (e) {
        emit(BestOrderError(e.toString()));
      }
    });
  }
}
