import 'package:hive/hive.dart';

part 'popular_model.g.dart';

@HiveType(typeId: 2) // رقم مختلف عن الباقيين
class PopularModel extends HiveObject {
  @HiveField(0)
  final String imageUrl;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String time;

  PopularModel({
    required this.imageUrl,
    required this.name,
    required this.time,
  });

  factory PopularModel.fromJson(Map<String, dynamic> json) {
    return PopularModel(
      imageUrl: json['image_url'] ?? '',
      name: json['name'] ?? '',
      time: json['time'] ?? '',
    );
  }
}
