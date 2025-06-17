import 'package:e_commerce_app/features/home/data/model/popular_model.dart';

abstract class PopularRepo {
  Future<List<PopularModel>> getPopular();
}
