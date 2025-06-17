import 'package:e_commerce_app/features/home/data/model/popular_model.dart';
import 'package:e_commerce_app/features/home/domain/repositories/popular_repo.dart';

class GetPopularItemsUseCase {
  final PopularRepo repository;

  GetPopularItemsUseCase(this.repository);

  Future<List<PopularModel>> call() async {
    return await repository.getPopular();
  }
}
