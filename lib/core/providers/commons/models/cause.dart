class Cause {
  int index;
  String title;
  String? imagePath;

  Cause({
    this.imagePath,
    required this.index,
    required this.title,
  });

  factory Cause.fromJson(Map<String, dynamic> json) {
    return Cause(
      index: json['index'],
      title: json['title'],
      imagePath: json['imagePath'],
    );
  }

  Cause copyWith({
    int? index,
    String? title,
    String? imagePath,
  }) {
    return Cause(
      index: index ?? this.index,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'title': title,
      'imagePath': imagePath,
    };
  }
}
