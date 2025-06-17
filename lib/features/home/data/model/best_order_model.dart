import 'package:hive/hive.dart';

part 'best_order_model.g.dart';

@HiveType(typeId: 1) // خلي typeId مختلف عن ServiceModel (مثلاً 1)
class BestOrderModel extends HiveObject {
  @HiveField(0)
  final String imageUrl;

  BestOrderModel({required this.imageUrl});

  factory BestOrderModel.fromJson(Map<String, dynamic> json) {
    return BestOrderModel(imageUrl: json['image_url']);
  }
}
