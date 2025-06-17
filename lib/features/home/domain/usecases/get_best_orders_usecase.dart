import 'package:e_commerce_app/features/home/data/model/best_order_model.dart';
import 'package:e_commerce_app/features/home/domain/repositories/best_order_repo.dart';

class GetBestOrdersUseCase {
  final BestOrderRepository repository;

  GetBestOrdersUseCase(this.repository);

  Future<List<BestOrderModel>> call() {
    return repository.getBestOrders();
  }
}
