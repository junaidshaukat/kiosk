import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Responsive extends StatelessWidget {
  final Widget Function(Orientation)? kiosk;
  final Widget Function(Orientation)? phone;
  final Widget Function(Orientation)? tablet;

  const Responsive({
    super.key,
    this.kiosk,
    this.phone,
    this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            Size size = MediaQuery.of(context).size;
            if (size.width < 834) {
              SizeUtils.setScreenSize(
                const Size(360, 720),
                DeviceType.phone,
                context,
                constraints,
                orientation,
              );

              return phone!(orientation);
            } else if (size.width < 834) {
              SizeUtils.setScreenSize(
                const Size(720, 360),
                DeviceType.tablet,
                context,
                constraints,
                orientation,
              );
              return tablet!(orientation);
            } else {
              SizeUtils.setScreenSize(
                const Size(1194, 834),
                DeviceType.kiosk,
                context,
                constraints,
                orientation,
              );
              return kiosk!(orientation);
            }
          },
        );
      },
    );
  }
}
