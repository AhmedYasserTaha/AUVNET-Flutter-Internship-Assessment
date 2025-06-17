import 'package:e_commerce_app/features/home/data/model/best_order_model.dart';

abstract class BestOrderRepository {
  Future<List<BestOrderModel>> getBestOrders();
}
