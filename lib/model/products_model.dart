class ProductsModel {
  ProductsModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
  late final int count;
  late final String next;
  late final String previous;
  late final List<Results> results;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'] ?? '';
    previous = json['previous'] ?? '';
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['next'] = next;
    _data['previous'] = previous;
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.price,
    required this.description,
    required this.rate,
    required this.category,
  });
  late final int id;
  late final String name;
  late final String imageLink;
  late final String price;
  late final String description;
  late final String rate;
  late final Category category;

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
    price = json['price'];
    description = json['description'];
    rate = json['rate'];
    category = Category.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image_link'] = imageLink;
    _data['price'] = price;
    _data['description'] = description;
    _data['rate'] = rate;
    _data['category'] = category.toJson();
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.imageLink,
  });
  late final int id;
  late final String name;
  late final String imageLink;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image_link'] = imageLink;
    return _data;
  }
}
