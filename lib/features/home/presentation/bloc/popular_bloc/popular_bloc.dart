import 'package:e_commerce_app/core/usecases/get_popular_items_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'popular_event.dart';
import 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final GetPopularItemsUseCase getPopularItemsUseCase;

  PopularBloc(this.getPopularItemsUseCase) : super(PopularInitial()) {
    on<LoadPopularItemsEvent>((event, emit) async {
      emit(PopularLoading());
      try {
        final items = await getPopularItemsUseCase();
        emit(PopularLoaded(items));
      } catch (e) {
        emit(PopularError(e.toString()));
      }
    });
  }
}
