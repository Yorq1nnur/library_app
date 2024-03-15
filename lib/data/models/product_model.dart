class ProductModel {
  String uuid;
  String color;
  String description;
  String imageUrl;
  String madeIn;
  int price;
  String productName;

  ProductModel({
    required this.uuid,
    required this.color,
    required this.description,
    required this.imageUrl,
    required this.madeIn,
    required this.price,
    required this.productName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    uuid: json["_uuid"] as String? ?? "",
    color: json["color"] as String? ?? "000000",
    description: json["description"] as String? ?? "This is description item",
    imageUrl: json["image_url"] as String? ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPwLh_Axc1Y5ShUppkHuzi_UbqMYLIrGTTI6iMlPfS0g&s",
    madeIn: json["made_in"] as String? ?? "Country",
    price: json["price"] as int ? ?? 0,
    productName: json["product_name"] as String? ?? "This is product name",
  );

  Map<String, dynamic> toJson() => {
    "_uuid": uuid,
    "color": color,
    "description": description,
    "image_url": imageUrl,
    "made_in": madeIn,
    "price": price,
    "product_name": productName,
  };

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "product_name": productName,
      "price": price,
      "description": description,
      "color": color,
      "image_url": imageUrl,
      "_uuid": uuid,
      "made_in":madeIn
    };
  }

}