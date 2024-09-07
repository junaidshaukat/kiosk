import 'package:flutter/material.dart';

class Cause {
  String label;
  String imagePath;
  Color circleColor;
  List<Color> colors;

  Cause({
    this.label = '',
    this.imagePath = '',
    this.colors = const [],
    this.circleColor = const Color(0xFFFFFFFF),
  });

  factory Cause.fromJson(Map<String, dynamic> json) {
    return Cause(
      label: json['label'] ?? '',
      imagePath: json['imagePath'] ?? '',
      colors: (json['colors'] as List<dynamic>?)
              ?.map((color) => Color(color as int))
              .toList() ??
          [],
      circleColor: Color(json['circleColor'] ?? 0xFFFFFFFF),
    );
  }

  Cause copyWith({
    String? label,
    String? imagePath,
    List<Color>? colors,
    Color? circleColor,
  }) {
    return Cause(
      label: label ?? this.label,
      imagePath: imagePath ?? this.imagePath,
      colors: colors ?? this.colors,
      circleColor: circleColor ?? this.circleColor,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'imagePath': imagePath,
      'colors': colors.map((color) => color.value).toList(),
      'circleColor': circleColor.value,
    };
  }
}
