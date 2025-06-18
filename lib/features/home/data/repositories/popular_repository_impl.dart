import 'package:hive/hive.dart';
import 'package:e_commerce_app/features/home/data/model/popular_model.dart';
import 'package:e_commerce_app/features/home/domain/repositories/popular_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PopularRepositoryImpl implements PopularRepo {
  final SupabaseClient supabase;

  PopularRepositoryImpl(this.supabase);

  @override
  Future<List<PopularModel>> getPopular() async {
    final box = await Hive.openBox<PopularModel>('popular_cache');

    try {
      final response = await supabase.from('popular').select();

      // ignore: unnecessary_null_comparison
      if (response == null || response.isEmpty) {
        // رجع الكاش لو مفيش بيانات من السيرفر
        return box.values.toList();
      }

      final popularItems =
          (response as List)
              .map(
                (item) => PopularModel.fromJson(item as Map<String, dynamic>),
              )
              .whereType<PopularModel>()
              .toList();

      // حدث الكاش
      await box.clear();
      await box.addAll(popularItems);

      return popularItems;
    } catch (e) {
      // لو في مشكلة في النت، رجع الكاش
      return box.values.toList();
    }
  }
}
