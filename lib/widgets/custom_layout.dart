import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Layout extends StatelessWidget {
  final Widget Function(Orientation) child;

  const Layout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            Size size = MediaQuery.of(context).size;
            if (size.width < 834) {
              SizeUtils.setScreenSize(context, constraints, orientation);
              return child(orientation);
            } else if (size.width < 834) {
              SizeUtils.setScreenSize(context, constraints, orientation);
              return child(orientation);
            } else {
              SizeUtils.setScreenSize(context, constraints, orientation);
              return child(orientation);
            }
          },
        );
      },
    );
  }
}
