import 'package:hive/hive.dart';

part 'service_model.g.dart';

@HiveType(typeId: 0)
class ServiceModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String discount;

  @HiveField(2)
  final String imageUrl;

  ServiceModel({
    required this.name,
    required this.discount,
    required this.imageUrl,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      name: json['name'],
      discount: json['discount'],
      imageUrl: json['image_url'],
    );
  }
}
