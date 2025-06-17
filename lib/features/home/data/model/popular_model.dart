class PopularModel {
  final String imageUrl;
  final String name;
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
