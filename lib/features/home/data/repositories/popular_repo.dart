import 'package:e_commerce_app/features/home/data/model/popular_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PopularRepo {
  final supabase = Supabase.instance.client;

  Future<List<PopularModel>> getPopular() async {
    try {
      final response = await supabase.from('popular').select();
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
                (item) => PopularModel.fromJson(item as Map<String, dynamic>),
              )
              .whereType<PopularModel>()
              .toList();

      print('Parsed services: $services');
      return services;
    } catch (e) {
      print('Error fetching services: $e');
      throw Exception('Failed to load services: $e');
    }
  }
}
