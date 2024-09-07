import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomRadioButton extends StatelessWidget {
  final Size? size;
  final double? gap;
  final String title;
  final bool isSelected;
  final double? fontSize;
  final void Function()? onTap;

  const CustomRadioButton({
    super.key,
    this.gap,
    this.size,
    this.onTap,
    this.fontSize,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CustomImageView(
            width: size?.width,
            height: size?.height,
            color: isSelected ? appTheme.primary : appTheme.gray600,
            imagePath: isSelected ? 'radio'.icon.svg : 'radio'.icon.svg,
          ),
          SizedBox(width: gap),
          Text(
            title,
            style: TextStyles.labelMedium.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: isSelected ? appTheme.primary : appTheme.gray600,
            ),
          )
        ],
      ),
    );
  }
}

class CustomRadioButtonWithText extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioButtonWithText({
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey,
                width: 2.0,
              ),
            ),
            child: isSelected
                ? Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  )
                : const SizedBox(width: 16.0, height: 16.0),
          ),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
