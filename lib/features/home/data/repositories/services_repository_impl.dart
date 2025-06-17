import 'package:e_commerce_app/features/home/data/model/service_model.dart';
import 'package:e_commerce_app/features/home/domain/repositories/services_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServicesRepositoryImpl implements ServicesRepo {
  final SupabaseClient supabase;

  ServicesRepositoryImpl(this.supabase);

  @override
  Future<List<ServiceModel>> getServices() async {
    try {
      final response = await supabase.from('services_table').select();

      if (response == null || response.isEmpty) {
        return [];
      }

      return (response as List)
          .map((item) => ServiceModel.fromJson(item as Map<String, dynamic>))
          .whereType<ServiceModel>()
          .toList();
    } catch (e) {
      throw Exception('Failed to load services: $e');
    }
  }
}
