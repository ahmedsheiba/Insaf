class SurplusModel {
  SurplusModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.coverImage,
  });

  final num id;
  final String name;
  final String description;
  final num price;
  final String? coverImage;

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'coverImage': coverImage,
    };
  }

  // Factory constructor for creating a new SurplusModel from JSON
  factory SurplusModel.fromJson(Map<String, dynamic> json) {
    return SurplusModel(
      id: json['id'] as num,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as num,
      coverImage: json['coverImage'] as String?,
    );
  }

  // Optional: Add copyWith method for easy modifications
  SurplusModel copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    String? coverImage,
  }) {
    return SurplusModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      coverImage: coverImage ?? this.coverImage,
    );
  }
}
