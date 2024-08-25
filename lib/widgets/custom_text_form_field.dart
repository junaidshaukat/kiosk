import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Input extends StatelessWidget {
  final bool? filled;
  final int maxLines;
  final bool autofocus;
  final Color? fillColor;
  final String? hintText;
  final TextStyle? style;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final InputBorder? borderDecoration;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final bool isDense;

  const Input({
    super.key,
    this.style,
    this.hintText,
    this.fillColor,
    this.hintStyle,
    this.focusNode,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.filled = true,
    this.contentPadding,
    this.isDense = false,
    this.borderDecoration,
    this.autofocus = false,
    this.obscureText = false,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      focusNode: focusNode,
      autofocus: autofocus,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: style ?? theme.textTheme.bodyLarge,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: InputDecoration(
        isDense: isDense,
        filled: filled,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText ?? "",
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        hintStyle: hintStyle ?? theme.textTheme.bodyLarge,
        fillColor: fillColor ?? theme.colorScheme.onPrimary,
        contentPadding: contentPadding ?? EdgeInsets.all(12.h),
        border: borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(9.h),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(9.h),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(9.h),
            ),
      ),
    );
  }
}
