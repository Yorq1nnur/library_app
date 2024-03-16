class BooksModel {
  final String? uuid;
  final String bookName;
  final String author;
  final int? categoryId;
  final String categoryName;
  final String description;
  final String imageUrl;
  final List<String>? images;
  final int price;
  final double rate;

  BooksModel({
     this.uuid,
    required this.bookName,
    required this.author,
     this.categoryId,
    required this.categoryName,
    required this.description,
    required this.imageUrl,
    this.images,
    required this.price,
    required this.rate,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      uuid: json['_uuid'] as String? ?? "",
      bookName: json['name'] as String? ?? "",
      author: json['author'] as String? ?? "",
      categoryId: json['category_id'] as int? ?? 0,
      categoryName: json['category_name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      images: List<String>.from(json['images']) as List<String>? ?? [],
      price: json['price'] as int? ?? 0,
      rate: json['rate'].toDouble() as double? ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_uuid': uuid,
      'name': bookName,
      'author': author,
      'category_id': categoryId,
      'category_name': categoryName,
      'description': description,
      'image_url': imageUrl,
      'images': images,
      'price': price,
      'rate': rate,
    };
  }

  BooksModel copyWith({
    String? uuid,
    String? name,
    String? author,
    int? categoryId,
    String? categoryName,
    String? description,
    String? imageUrl,
    List<String>? images,
    int? price,
    double? rate,
  }) {
    return BooksModel(
      uuid: uuid ?? this.uuid,
      bookName: name ?? bookName,
      author: author ?? this.author,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      images: images ?? this.images,
      price: price ?? this.price,
      rate: rate ?? this.rate,
    );
  }
    Map<String, dynamic> toJsonForUpdate() {
      return {
        "_uuid": uuid,
        "name": bookName,
        "author": author,
        "category_id": categoryId,
        "category_name": categoryName,
        "description": description,
        "image_url": imageUrl,
        "images": images,
        "price": price,
        "rate": rate,
      };
    }



}
