class BestOrderModel {
  final String imageUrl;

  BestOrderModel({required this.imageUrl});

  factory BestOrderModel.fromJson(Map<String, dynamic> json) {
    return BestOrderModel(imageUrl: json['image_url']);
  }
}
