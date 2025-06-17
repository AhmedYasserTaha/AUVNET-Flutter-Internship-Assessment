import 'package:e_commerce_app/features/home/data/model/popular_model.dart';
import 'package:e_commerce_app/features/home/domain/repositories/popular_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PopularRepositoryImpl implements PopularRepo {
  final SupabaseClient supabase;

  PopularRepositoryImpl(this.supabase);

  @override
  Future<List<PopularModel>> getPopular() async {
    try {
      final response = await supabase.from('popular').select();

      if (response == null || response.isEmpty) {
        return [];
      }

      return (response as List)
          .map((item) => PopularModel.fromJson(item as Map<String, dynamic>))
          .whereType<PopularModel>()
          .toList();
    } catch (e) {
      throw Exception('Failed to load popular items: $e');
    }
  }
}
