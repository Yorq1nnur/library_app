class BooksModel {
  final String? uuid;
  final String bookName;
  final String author;
  final String? categoryId;
  final String categoryName;
  final String description;
  final String imageUrl;
  final String price;
  final String rate;

  BooksModel({
     this.uuid,
    required this.bookName,
    required this.author,
     this.categoryId,
    required this.categoryName,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rate,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      uuid: json['_uuid'] as String? ?? "",
      bookName: json['name'] as String? ?? "",
      author: json['author'] as String? ?? "",
      categoryId: json['_uuid'] as String? ?? "",
      categoryName: json['category_name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      price: json['price'] as String? ?? '',
      rate: json['rate']as String? ?? '',
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
      'price': price,
      'rate': rate,
    };
  }

  BooksModel copyWith({
    String? uuid,
    String? name,
    String? author,
    String? categoryId,
    String? categoryName,
    String? description,
    String? imageUrl,
    String? price,
    String? rate,
  }) {
    return BooksModel(
      uuid: uuid ?? this.uuid,
      bookName: name ?? bookName,
      author: author ?? this.author,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      rate: rate ?? this.rate,
    );
  }
    Map<String, dynamic> toJsonForUpdate() {
      return {
        "_uuid": uuid ?? uuid,
        "name": bookName,
        "author": author,
        "category_id": categoryId ?? categoryId,
        "category_name": categoryName,
        "description": description,
        "image_url": imageUrl,
        "price": price,
        "rate": rate,
      };
    }



}
