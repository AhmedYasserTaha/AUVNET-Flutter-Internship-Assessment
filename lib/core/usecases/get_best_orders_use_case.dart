import 'package:e_commerce_app/features/home/data/model/best_order_model.dart';
import 'package:e_commerce_app/features/home/data/repositories/best_order_repo.dart';

class GetBestOrdersUseCase {
  final BestOrderRepo repo;

  GetBestOrdersUseCase(this.repo);

  Future<List<BestOrderModel>> call() async {
    return await repo.getImage();
  }
}
