import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
// Outline decorations
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.adaptSize,
        ),
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 4.adaptSize,
        ),
      );
  static BoxDecoration get outlinePrimary2 => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 4.adaptSize,
        ),
      );
// Primary decorations
  static BoxDecoration get primary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
// White decorations
  static BoxDecoration get whiteFFFFFF => BoxDecoration(
        border: Border.all(
          color: appTheme.gray200,
          width: 1.adaptSize,
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.adaptSize,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.adaptSize,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.adaptSize,
      );
  static BorderRadius get roundedBorder70 => BorderRadius.circular(
        70.adaptSize,
      );
}
