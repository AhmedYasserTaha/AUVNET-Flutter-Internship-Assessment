import 'package:e_commerce_app/features/home/data/model/service_model.dart';

abstract class ServicesState {}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final List<ServiceModel> services;

  ServicesLoaded(this.services);
}

class ServicesError extends ServicesState {
  final String error;

  ServicesError(this.error);
}
