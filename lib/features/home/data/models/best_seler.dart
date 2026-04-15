class BestSeler {
  final int id;
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  final String categoryId;

  BestSeler({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
  });

  factory BestSeler.fromJson(Map<String, dynamic> json) {
    return BestSeler(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['image_url'],
      categoryId: json['category_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'category_id': categoryId,
    };
  }
  static List<BestSeler> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => BestSeler.fromJson(json)).toList();
  }
}