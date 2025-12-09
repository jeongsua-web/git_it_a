class Product {
  final String? id;
  final List<String> images;
  final String title;
  final String category;
  final String? price;
  final bool isShare;
  final String description;
  final String location;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Product({
    this.id,
    required this.images,
    required this.title,
    required this.category,
    this.price,
    required this.isShare,
    required this.description,
    required this.location,
    this.createdAt,
    this.updatedAt,
  });

  // JSON 변환
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      title: json['title'] as String? ?? '',
      category: json['category'] as String? ?? '',
      price: json['price'] as String?,
      isShare: json['isShare'] as bool? ?? false,
      description: json['description'] as String? ?? '',
      location: json['location'] as String? ?? '',
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt'] as String) 
          : null,
      updatedAt: json['updatedAt'] != null 
          ? DateTime.parse(json['updatedAt'] as String) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'images': images,
      'title': title,
      'category': category,
      'price': price,
      'isShare': isShare,
      'description': description,
      'location': location,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  // copyWith 메서드
  Product copyWith({
    String? id,
    List<String>? images,
    String? title,
    String? category,
    String? price,
    bool? isShare,
    String? description,
    String? location,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      images: images ?? this.images,
      title: title ?? this.title,
      category: category ?? this.category,
      price: price ?? this.price,
      isShare: isShare ?? this.isShare,
      description: description ?? this.description,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
