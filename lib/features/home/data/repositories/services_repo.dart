import 'package:e_commerce_app/features/home/data/model/service_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServicesRepo {
  // Create a Supabase client instance to access the database
  final supabase = Supabase.instance.client;

  Future<List<ServiceModel>> getServices() async {
    try {
      // Fetch all data from the 'services_table' table
      // Ensure that the table name 'services_table' matches what is in your Supabase database
      final response = await supabase.from('services_table').select();
      print('Supabase response: $response');

      // ignore: unnecessary_null_comparison
      // Check if the response is null or does not contain data
      if (response == null || response.isEmpty) {
        print('Supabase returned null or empty response');
        return [];
      }
      // Convert the received data (list of maps) into a list of ServiceModel objects
      final List<dynamic> data = response;
      final services =
          data
              .map(
                (item) => ServiceModel.fromJson(item as Map<String, dynamic>),
              )
              // Use whereType to filter out any nulls that might result from parsing errors,
              // though the current fromJson doesn't seem to produce nulls but might throw.
              .whereType<ServiceModel>()
              .toList();

      print('Parsed services: $services');
      return services;
    } catch (e) {
      // In case of any error during data fetching or processing
      print('Error fetching services: $e');
      throw Exception('Failed to load services: $e');
    }
  }
}
