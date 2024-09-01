import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomHeader extends StatelessWidget {
  final String label;
  final double? fontSize1;
  final double? fontSize2;
  final void Function()? onCancel;

  const CustomHeader({
    super.key,
    this.onCancel,
    this.fontSize1,
    this.fontSize2,
    this.label = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.adaptSize,
          horizontal: 12.adaptSize,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              label,
              style: TextStyles.displayMedium.copyWith(
                fontSize: fontSize2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Positioned(
              left: 0,
              child: InkWell(
                onTap: onCancel,
                child: Text(
                  "lbl_cancel".tr,
                  textAlign: TextAlign.left,
                  style: TextStyles.headlineLarge.copyWith(
                    color: appTheme.lime800,
                    fontSize: fontSize1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
