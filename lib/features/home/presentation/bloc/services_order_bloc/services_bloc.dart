import 'package:e_commerce_app/features/home/domain/repositories/services_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services_event.dart';
import 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServicesRepo servicesRepo;

  ServicesBloc(this.servicesRepo) : super(ServicesInitial()) {
    on<LoadServicesEvent>((event, emit) async {
      emit(ServicesLoading());
      try {
        final services = await servicesRepo.getServices();
        emit(ServicesLoaded(services));
      } catch (e) {
        emit(ServicesError(e.toString()));
      }
    });
  }
}
