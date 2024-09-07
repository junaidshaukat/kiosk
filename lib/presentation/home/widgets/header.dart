import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomAppbar extends StatelessWidget {
  final bool back;
  final String label;
  final String? icon;
  final double? height;
  final double? fontSize;
  final String? imagePath;
  final double? btnFontSize;
  final void Function()? onNext;
  final EdgeInsetsGeometry? padding;

  const CustomAppbar({
    super.key,
    this.icon,
    this.height,
    this.onNext,
    this.padding,
    this.imagePath,
    this.label = '',
    this.back = false,
    this.fontSize = 22,
    this.btnFontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.maxFinite,
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 2.adaptSize,
              vertical: 2.adaptSize,
            ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: CustomImageView(
                fit: BoxFit.contain,
                imagePath: imagePath,
              ),
            ),
            Positioned(
              left: 10.adaptSize,
              child: SizedBox(
                width: 20.adaptSize,
                child: Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: TextStyles.displayMedium.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            if (!back) ...[
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: onNext,
                  child: CustomImageView(
                    imagePath: icon,
                    width: 6.adaptSize,
                    height: 6.adaptSize,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
            if (back) ...[
              Positioned(
                right: 0,
                child: SizedBox(
                  width: 20.adaptSize,
                  child: Text(
                    'lbl_cancel'.tr,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyles.displayMedium.copyWith(
                      fontSize: btnFontSize,
                      color: appTheme.lime800,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
