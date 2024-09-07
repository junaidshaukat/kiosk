import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomElevatedButton extends StatelessWidget {
  final Size? size;
  final String name;
  final double? width;
  final double? height;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final void Function()? onPressed;

  const CustomElevatedButton({
    super.key,
    this.size,
    this.style,
    this.width,
    this.height,
    this.onPressed,
    this.textStyle,
    required this.name,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: textStyle,
        foregroundColor: foregroundColor ?? appTheme.white,
        backgroundColor: backgroundColor ?? appTheme.green900,
        minimumSize:
            size ?? Size(width ?? double.maxFinite, height ?? 50.adaptSize),
        maximumSize:
            size ?? Size(width ?? double.maxFinite, height ?? 50.adaptSize),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          name,
        ),
      ),
    );
  }
}
