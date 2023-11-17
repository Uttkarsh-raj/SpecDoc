class Categories {
  final String title;
  final String desc;
  Categories({
    required this.title,
    required this.desc,
  });

  Categories copyWith({
    String? title,
    String? desc,
  }) {
    return Categories(
      title: title ?? this.title,
      desc: desc ?? this.desc,
    );
  }

  Categories fromJSON(dynamic json) {
    return Categories(title: json['categories'], desc: json['description']);
  }

  List<Categories> fromListJson(List<dynamic> response) {
    return response
        .map((category) => Categories(
            title: category["categories"], desc: category["description"]))
        .toList();
  }

  @override
  String toString() => 'Categories(title: $title, desc: $desc)';

  @override
  bool operator ==(covariant Categories other) {
    if (identical(this, other)) return true;

    return other.title == title && other.desc == desc;
  }

  @override
  int get hashCode => title.hashCode ^ desc.hashCode;
}
