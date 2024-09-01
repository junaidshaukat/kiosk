import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Confirmation extends StatelessWidget {
  final String title;
  final double? titleFontSize;

  final String amount;
  final double? amountFontSize;
  final double? amountLabelFontSize;

  final String fee;
  final double? feeFontSize;
  final double? feeLabelFontSize;

  final String tax;
  final double? taxFontSize;
  final double? taxLabelFontSize;

  final String total;
  final double? totalFontSize;
  final double? totalLabelFontSize;

  const Confirmation({
    super.key,
    this.title = '',
    this.titleFontSize,
    this.amount = '0',
    this.amountFontSize,
    this.amountLabelFontSize,
    this.fee = '0',
    this.feeFontSize,
    this.feeLabelFontSize,
    this.tax = '0',
    this.taxFontSize,
    this.taxLabelFontSize,
    this.total = '0',
    this.totalFontSize,
    this.totalLabelFontSize,
  });

  Widget tile({
    Color? color1,
    Color? color2,
    String? value,
    String label = '',
    double? fontSize1,
    double? fontSize2,
    FontWeight? fontWeight1,
    FontWeight? fontWeight2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyles.displayLarge.copyWith(
              color: color1,
              fontSize: fontSize1,
              fontWeight: fontWeight1,
            ),
          ),
        ),
        if (value != null) ...[
          Expanded(
            child: Text(
              value,
              style: TextStyles.displayLarge.copyWith(
                color: color2,
                fontSize: fontSize2,
                fontWeight: fontWeight2,
              ),
            ),
          )
        ]
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 12.adaptSize),
        tile(
          label: title,
          fontSize1: titleFontSize,
          color1: appTheme.lime800,
          fontWeight1: FontWeight.w700,
        ),
        tile(
          value: amount,
          label: "lbl_mosque".tr,
          color2: appTheme.primary,
          fontSize1: amountFontSize,
          color1: appTheme.black900,
          fontWeight1: FontWeight.w500,
          fontWeight2: FontWeight.w700,
          fontSize2: amountLabelFontSize,
        ),
        tile(
          value: fee,
          fontSize1: feeFontSize,
          color2: appTheme.primary,
          color1: appTheme.black900,
          label: "lbl_device_fee".tr,
          fontSize2: feeLabelFontSize,
          fontWeight1: FontWeight.w500,
          fontWeight2: FontWeight.w700,
        ),
        tile(
          value: tax,
          label: "lbl_tax".tr,
          fontSize1: taxFontSize,
          color2: appTheme.primary,
          color1: appTheme.black900,
          fontSize2: taxLabelFontSize,
          fontWeight1: FontWeight.w500,
          fontWeight2: FontWeight.w700,
        ),
        Divider(
          thickness: 1.5,
          color: appTheme.primary,
        ),
        tile(
          value: total,
          label: "lbl_total".tr,
          fontSize1: totalFontSize,
          color1: appTheme.primary,
          color2: appTheme.primary,
          fontWeight1: FontWeight.w500,
          fontWeight2: FontWeight.w700,
          fontSize2: totalLabelFontSize,
        ),
      ],
    );
  }
}
