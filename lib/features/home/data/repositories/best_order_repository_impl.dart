import 'package:e_commerce_app/features/home/data/model/best_order_model.dart';
import 'package:e_commerce_app/features/home/domain/repositories/best_order_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BestOrderRepositoryImpl implements BestOrderRepository {
  final SupabaseClient supabase;

  BestOrderRepositoryImpl(this.supabase);

  @override
  Future<List<BestOrderModel>> getBestOrders() async {
    final box = await Hive.openBox<BestOrderModel>('best_orders_cache');

    try {
      final response = await supabase.from('services').select();

      if (response == null || response.isEmpty) {
        return box.values.toList(); // رجع الكاش لو مفيش بيانات
      }

      final bestOrders =
          (response as List)
              .map((e) => BestOrderModel.fromJson(e as Map<String, dynamic>))
              .toList();

      await box.clear();
      await box.addAll(bestOrders);

      return bestOrders;
    } catch (e) {
      return box.values.toList(); // لو حصل خطأ رجع الكاش بدل الاستثناء
    }
  }
}
