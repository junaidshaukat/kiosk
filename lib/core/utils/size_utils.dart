import 'package:flutter/material.dart';

import 'console.dart';
// These are the Viewport values of your Figma Design.

// These are used in the code as a reference to create your UI Responsively.
num fdw = 393;
num fdh = 852;

num columns = 4;
double gutter = 16;

num fdsb = 0;

extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get _height => SizeUtils.height;

  double get h => ((this * _width) / fdw);
  double get v => (this * _height) / (fdh - fdsb);

  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  double get fSize => adaptSize;
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.builder});

  /// Builds the widget whenever the orientation changes.
  final ResponsiveBuild builder;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        double breakpoints = 0.0;

        if (orientation == Orientation.portrait) {
          breakpoints = MediaQuery.of(context).size.width;
        }

        if (orientation == Orientation.landscape) {
          breakpoints = MediaQuery.of(context).size.height;
        }

        console.log({
          'breakpoints': breakpoints,
          'size': MediaQuery.of(context).size,
          'orientation': orientation,
        });

        if (breakpoints >= 0 && breakpoints <= 599) {
          columns = 4;
          gutter = 16;

          fdw = 393;
          fdh = 852;
        } else if (breakpoints >= 600 && breakpoints <= 904) {
          columns = 8;
          gutter = 16;

          fdw = 430;
          fdh = 932;
        } else if (breakpoints >= 905 && breakpoints <= 1239) {
          columns = 12;
          gutter = 24;

          fdw = 744;
          fdh = 960;
        } else if (breakpoints >= 1240 && breakpoints <= 1439) {
          columns = 12;
          gutter = 24;

          fdw = 840;
          fdh = 720;
        } else {
          columns = 12;
          gutter = 32;

          fdw = 1280;
          fdh = 720;
        }

        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

class SizeUtils {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;
  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    if (orientation == Orientation.portrait) {
      height = boxConstraints.maxHeight.isNonZero();
      width = boxConstraints.maxWidth.isNonZero(defaultValue: fdw);
    } else {
      // width = boxConstraints.maxHeight.isNonZero(defaultValue: fdw);
      // height = boxConstraints.maxWidth.isNonZero();
      height = boxConstraints.maxHeight.isNonZero();
      width = boxConstraints.maxWidth.isNonZero(defaultValue: fdw);
    }
    deviceType = DeviceType.mobile;
  }
}
