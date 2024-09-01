import 'package:flutter/material.dart';
import '/core/app_export.dart';

class BottomArea extends StatelessWidget {
  final bool next;
  final bool back;

  final String? label;
  final String? imagePath;
  final String lblNext;
  final String lblBack;
  final void Function()? onNext;
  final void Function()? onBack;

  final double? height;
  final double? lblWidth;
  final Size buttonSize;
  final double? fontSize;
  final double radius;

  const BottomArea({
    super.key,
    this.label,
    this.onNext,
    this.onBack,
    this.fontSize,
    this.imagePath,
    this.next = true,
    this.lblNext = '',
    this.lblBack = '',
    this.back = false,
    this.radius = 8,
    this.height = 128,
    this.lblWidth = 128,
    this.buttonSize = const Size(100, 60),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          if (imagePath != null) ...[
            SizedBox(width: 8.adaptSize),
            CustomImageView(
              fit: BoxFit.cover,
              imagePath: imagePath,
            ),
            SizedBox(width: 1.adaptSize),
            SizedBox(
              width: lblWidth,
              child: Text(
                "$label",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.headlineSmall.copyWith(
                  fontSize: fontSize,
                  color: appTheme.gray600,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
          if (back) ...[
            SizedBox(width: 8.adaptSize),
            Container(
              width: buttonSize.width,
              height: buttonSize.height,
              decoration: AppDecoration.primary.copyWith(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                  width: 1.adaptSize,
                  color: appTheme.lime800,
                ),
              ),
              child: InkWell(
                onTap: onBack,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (lblBack == "lbl_back") ...[
                          CustomImageView(
                            color: appTheme.lime800,
                            imagePath: 'chevron-left'.icon.svg,
                          ),
                          SizedBox(width: 2.h),
                        ],
                        Text(
                          lblBack.tr,
                          style: TextStyles.displayLarge.copyWith(
                            fontSize: fontSize,
                            color: appTheme.lime800,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.adaptSize),
          ],
          if (next) ...[
            const Spacer(),
            Container(
              width: buttonSize.width,
              height: buttonSize.height,
              decoration: AppDecoration.primary.copyWith(
                borderRadius: BorderRadius.circular(radius),
              ),
              child: InkWell(
                onTap: onNext,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          lblNext.tr,
                          style: TextStyles.displayLarge.copyWith(
                            fontSize: fontSize,
                            color: appTheme.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (lblNext == "lbl_next") ...[
                          SizedBox(width: 2.adaptSize),
                          CustomImageView(
                            color: appTheme.white,
                            imagePath: 'chevron-right'.icon.svg,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.adaptSize)
          ]
        ],
      ),
    );
  }
}
