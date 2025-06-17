import 'package:e_commerce_app/features/home/data/model/service_model.dart';

abstract class ServicesRepo {
  Future<List<ServiceModel>> getServices();
}
