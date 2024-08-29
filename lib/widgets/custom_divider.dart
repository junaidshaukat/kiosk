import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final Color shadow;
  final Offset offset;
  final double? height;
  final double blurRadius;

  const CustomDivider({
    super.key,
    this.height = 1.5,
    this.blurRadius = 1.2,
    this.offset = const Offset(0, 1),
    this.color = const Color(0xFFE0E0E0),
    this.shadow = const Color(0XFF000000),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: shadow.withOpacity(0.25),
          )
        ],
      ),
    );
  }
}
