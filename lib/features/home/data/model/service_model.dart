class ServiceModel {
  final String name;
  final String discount;
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
