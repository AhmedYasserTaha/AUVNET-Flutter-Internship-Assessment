import 'package:e_commerce_app/features/home/data/model/best_order_model.dart';
import 'package:e_commerce_app/features/home/domain/repositories/best_order_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BestOrderRepositoryImpl implements BestOrderRepository {
  final SupabaseClient supabase;

  BestOrderRepositoryImpl(this.supabase);

  @override
  Future<List<BestOrderModel>> getBestOrders() async {
    try {
      final response = await supabase.from('services').select();

      // ignore: unnecessary_null_comparison
      if (response == null || response.isEmpty) return [];

      return (response as List)
          .map((e) => BestOrderModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load best orders: $e');
    }
  }
}
