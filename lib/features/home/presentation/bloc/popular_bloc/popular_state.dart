import 'package:e_commerce_app/features/home/data/model/popular_model.dart';

abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  final List<PopularModel> items;

  PopularLoaded(this.items);
}

class PopularError extends PopularState {
  final String message;

  PopularError(this.message);
}
