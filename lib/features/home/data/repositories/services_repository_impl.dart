import 'package:e_commerce_app/features/home/data/model/service_model.dart';
import 'package:e_commerce_app/features/home/domain/repositories/services_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ServicesRepositoryImpl implements ServicesRepo {
  final SupabaseClient supabase;

  ServicesRepositoryImpl(this.supabase);

  @override
  Future<List<ServiceModel>> getServices() async {
    final box = await Hive.openBox<ServiceModel>('services_cache');

    try {
      final response = await supabase.from('services_table').select();

      if (response == null || response.isEmpty) {
        // لو مفيش داتا في السيرفر، رجع الكاش
        return box.values.toList();
      }

      final services =
          (response as List)
              .map(
                (item) => ServiceModel.fromJson(item as Map<String, dynamic>),
              )
              .whereType<ServiceModel>()
              .toList();

      // نخزن الكاش (نمسح القديم ونضيف الجديد)
      await box.clear();
      await box.addAll(services);

      return services;
    } catch (e) {
      // لو حصل Error نرجع الكاش بدل ما نرمي Exception
      return box.values.toList();
    }
  }
}
