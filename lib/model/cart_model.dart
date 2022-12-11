class CartModel {
  CartModel({
    required this.id,
    required this.quantity,
    required this.name,
    required this.imageLink,
    required this.price,
    required this.description,
    required this.rate,
    required this.catId,
    required this.catImage,
    required this.catName,
    // required this.category,
  });
  late final int id;
  late final int quantity;
  late final String name;
  late final String imageLink;
  late final String price;
  late final String description;
  late final String rate;
  late final int catId;
  late final String catName;
  late final String catImage;
  // late final Category category;

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['productId'];
    name = json['productName'];
    imageLink = json['productImage'];
    price = json['productPrice'];
    description = json['productDesc'];
    rate = json['productRate'];
    quantity = json['quantity'];
    catId = json['productCatId'];
    catName = json['productCategory'];
    catImage = json['productCatImage'];
    // category = Category.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['productId'] = id;
    _data['productName'] = name;
    _data['productImage'] = imageLink;
    _data['productPrice'] = price;
    _data['productDesc'] = description;
    _data['productRate'] = rate;
    _data['quantity'] = quantity;
    _data['productCatId'] = catId;
    _data['productCategory'] = catName;
    _data['productCatImage'] = catImage;
    // _data['category'] = category.toJson();
    return _data;
  }
}
