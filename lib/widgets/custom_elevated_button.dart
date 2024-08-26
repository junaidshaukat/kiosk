import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomElevatedButton extends StatelessWidget {
  final String name;
  final ButtonStyle? style;
  final void Function()? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Size? size;

  const CustomElevatedButton({
    super.key,
    this.style,
    this.onPressed,
    required this.name,
    this.foregroundColor,
    this.backgroundColor,
    this.textStyle,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: textStyle,
        foregroundColor: foregroundColor ?? appTheme.white,
        backgroundColor: backgroundColor ?? appTheme.green900,
        minimumSize: size ?? Size(double.maxFinite, 50.v),
        maximumSize: size ?? Size(double.maxFinite, 50.v),
      ),
      onPressed: onPressed,
      child: Text(name),
    );
  }
}
