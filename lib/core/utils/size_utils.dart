import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

num fdw = 1194; // reference width
num fdh = 834; // reference height
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

  num get deviceWidth {
    if (this <= 240) {
      return 200;
    } else if (this <= 320) {
      return 240;
    } else if (this <= 480) {
      return 320;
    } else if (this <= 800) {
      return 480;
    } else if (this <= 1280) {
      return 800;
    } else if (this <= 1920) {
      return 1280;
    } else if (this <= 2560) {
      return 1920;
    } else if (this <= 3840) {
      return 2560;
    } else if (this <= 5120) {
      return 3840;
    } else if (this <= 6016) {
      return 5120;
    } else if (this <= 7680) {
      return 6016;
    } else {
      return 7680;
    }
  }

  num get deviceHeight {
    if (this <= 360) {
      return 300;
    } else if (this <= 480) {
      return 360;
    } else if (this <= 720) {
      return 480;
    } else if (this <= 800) {
      return 720;
    } else if (this <= 1080) {
      return 800;
    } else if (this <= 1440) {
      return 1080;
    } else if (this <= 2160) {
      return 1440;
    } else if (this <= 2880) {
      return 2160;
    } else if (this <= 3384) {
      return 2880;
    } else if (this <= 4320) {
      return 3384;
    } else {
      return 4320;
    }
  }
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
            SizeUtils.setScreenSize(context, constraints, orientation);
            return builder(context, orientation, SizeUtils.deviceType);
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
    BuildContext context,
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    statusBarHeight = MediaQuery.of(context).padding.top;
    setResolutions(orientation, MediaQuery.of(context).size);

    if (orientation == Orientation.portrait) {
      height = boxConstraints.maxHeight.isNonZero();
      width = boxConstraints.maxWidth.isNonZero(defaultValue: fdw);
    } else {
      height = boxConstraints.maxWidth.isNonZero();
      width = boxConstraints.maxHeight.isNonZero(defaultValue: fdh);
    }
    deviceType = _getDeviceType();
  }

  static setResolutions(Orientation orientation, Size size) {
    fdw = size.width.deviceWidth;
    fdh = size.height.deviceHeight;
  }

  static DeviceType _getDeviceType() {
    if (boxConstraints.maxWidth >= 600) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }
}
