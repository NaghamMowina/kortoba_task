class CategoriesModel {
  CategoriesModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
  late final int count;
  late final Null next;
  late final Null previous;
  late final List<Results> results;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = null;
    previous = null;
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
  });
  late final int id;
  late final String name;
  late final String imageLink;

  Results.fromJson(Map<String, dynamic> json) {
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
