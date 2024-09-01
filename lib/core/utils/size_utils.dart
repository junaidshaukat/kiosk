import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

num fdw = 0; // reference width
num fdh = 0; // reference height
num fdsb = 0; // reference status bar height

extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get _height => SizeUtils.height;

  // Horizontal scaling factor
  double get h => ((this * _width) / fdw);

  // Vertical scaling factor
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

enum DeviceType { phone, tablet, kiosk }

enum PlatformType { android, ios, fuchsia, linux, macos, windows, other, web }

PlatformType get getPlatform {
  if (kIsWeb) {
    return PlatformType.web;
  } else if (Platform.isAndroid) {
    return PlatformType.android;
  } else if (Platform.isIOS) {
    return PlatformType.ios;
  } else if (Platform.isFuchsia) {
    return PlatformType.fuchsia;
  } else if (Platform.isLinux) {
    return PlatformType.linux;
  } else if (Platform.isMacOS) {
    return PlatformType.macos;
  } else if (Platform.isWindows) {
    return PlatformType.windows;
  } else {
    return PlatformType.other;
  }
}

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.builder});

  /// Builds the widget whenever the orientation changes.
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    buildContext = context;

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            Size size = MediaQuery.of(context).size;

            if (size.width < 834) {
              SizeUtils.setScreenSize(
                const Size(430, 932),
                DeviceType.phone,
                context,
                constraints,
                orientation,
              );

              return builder(context, orientation, SizeUtils.deviceType);
            } else if (size.width < 1194) {
              SizeUtils.setScreenSize(
                const Size(932, 430),
                DeviceType.tablet,
                context,
                constraints,
                orientation,
              );

              return builder(context, orientation, SizeUtils.deviceType);
            } else {
              SizeUtils.setScreenSize(
                const Size(1194, 834),
                DeviceType.kiosk,
                context,
                constraints,
                orientation,
              );
              return builder(context, orientation, SizeUtils.deviceType);
            }
          },
        );
      },
    );
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

  /// Status bar height
  static late double statusBarHeight;

  static void setScreenSize(
    Size size,
    DeviceType device,
    BuildContext context,
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    deviceType = device;
    boxConstraints = constraints;
    orientation = currentOrientation;
    statusBarHeight = MediaQuery.of(context).padding.top;

    if (orientation == Orientation.portrait) {
      fdw = size.width;
      fdh = size.height;

      height = boxConstraints.maxHeight.isNonZero();
      width = boxConstraints.maxWidth.isNonZero(defaultValue: fdw);
    } else {
      fdw = size.width;
      fdh = size.height;

      height = boxConstraints.maxWidth.isNonZero();
      width = boxConstraints.maxHeight.isNonZero(defaultValue: fdh);
    }
  }
}
