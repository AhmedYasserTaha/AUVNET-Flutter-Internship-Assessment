import 'package:e_commerce_app/features/home/data/model/best_order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BestOrderRepo {
  final supabase = Supabase.instance.client;

  Future<List<BestOrderModel>> getImage() async {
    try {
      final response = await supabase.from('services').select();
      print('Supabase response: $response');

      // ignore: unnecessary_null_comparison
      if (response == null || response.isEmpty) {
        print('Supabase returned null or empty response');
        return [];
      }

      final List<dynamic> data = response;
      final services =
          data
              .map(
                (item) => BestOrderModel.fromJson(item as Map<String, dynamic>),
              )
              .whereType<BestOrderModel>()
              .toList();

      print('Parsed services: $services');
      return services;
    } catch (e) {
      print('Error fetching services: $e');
      throw Exception('Failed to load services: $e');
    }
  }
}
