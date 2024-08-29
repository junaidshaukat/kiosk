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

  const BottomArea({
    super.key,
    this.label,
    this.onNext,
    this.onBack,
    this.imagePath,
    this.next = true,
    this.lblNext = '',
    this.lblBack = '',
    this.back = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.v,
      width: double.maxFinite,
      child: Row(
        children: [
          if (imagePath != null) ...[
            SizedBox(width: 4.h),
            CustomImageView(
              fit: BoxFit.cover,
              imagePath: imagePath,
            ),
            SizedBox(width: 1.h),
            SizedBox(
              width: 110.h,
              child: Text(
                "$label",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.headlineSmall.copyWith(
                  color: appTheme.gray600,
                ),
              ),
            ),
          ],
          if (back) ...[
            SizedBox(width: 4.h),
            Container(
              width: 80.h,
              height: 38.v,
              decoration: AppDecoration.primary.copyWith(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.adaptSize),
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
                          SizedBox(width: 1.h),
                        ],
                        Text(
                          lblBack.tr,
                          style: TextStyles.displayLarge.copyWith(
                            fontSize: 18.fSize,
                            color: appTheme.lime800,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 4.h),
          ],
          if (next) ...[
            const Spacer(),
            Container(
              width: 80.h,
              height: 38.v,
              decoration: AppDecoration.primary.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
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
                            fontSize: 18.fSize,
                            color: appTheme.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (lblNext == "lbl_next") ...[
                          SizedBox(width: 1.h),
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
            SizedBox(width: 4.h)
          ]
        ],
      ),
    );
  }
}
