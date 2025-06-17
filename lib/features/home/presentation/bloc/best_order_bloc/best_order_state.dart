import 'package:e_commerce_app/features/home/data/model/best_order_model.dart';

abstract class BestOrderState {}

class BestOrderInitial extends BestOrderState {}

class BestOrderLoading extends BestOrderState {}

class BestOrderLoaded extends BestOrderState {
  final List<BestOrderModel> images;

  BestOrderLoaded(this.images);
}

class BestOrderError extends BestOrderState {
  final String message;

  BestOrderError(this.message);
}
