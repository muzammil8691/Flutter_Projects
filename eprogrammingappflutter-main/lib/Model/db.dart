/*
class Category {
  int id;
  String name;
  String icon;

  Category({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
        id: map['id'],
        name: map['name'],
        icon: map['icon']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
    };
  }
}
*/

class Tutorial {
  int id;
  String title;
  String description;
  String code;
  String videolinks;
  int categoryId;

  Tutorial({
    required this.id,
    required this.title,
    required this.description,
    required this.code,
    required this.videolinks,
    required this.categoryId});

  factory Tutorial.fromMap(Map<String, dynamic> map) {
    return Tutorial(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      code: map['code'],
      videolinks: map['videolinks'],
      categoryId: map['category_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'code': code,
      'videolinks': videolinks,
      'category_id': categoryId,
    };
  }
}
