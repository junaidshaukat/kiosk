import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomHeader extends StatelessWidget {
  final String label;
  final void Function()? onCancel;

  const CustomHeader({
    super.key,
    this.label = '',
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.v,
          horizontal: 12.h,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              label,
              style: TextStyles.displayMedium.copyWith(
                fontSize: 24.fSize,
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
                    fontSize: 18.fSize,
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
