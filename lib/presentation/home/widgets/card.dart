import 'package:flutter/material.dart';
import '/core/app_export.dart';

class WidgetCard extends StatelessWidget {
  final double width;
  final double radius;
  final double height;
  final Widget? child;
  final Color background;
  final void Function()? onPressed;

  const WidgetCard({
    super.key,
    this.child,
    this.onPressed,
    this.width = 200,
    this.radius = 16,
    this.height = 200,
    this.background = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 2.5,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: child,
    );
  }
}

class CustomCard extends StatelessWidget {
  final String label;
  final double width;
  final double radius;
  final double circle;
  final double height;
  final double fontSize;
  final Color background;
  final Color circleColor;
  final String? imagePath;
  final List<Color> colors;
  final void Function()? onPressed;

  const CustomCard({
    super.key,
    this.imagePath,
    this.onPressed,
    this.label = '',
    this.width = 200,
    this.radius = 16,
    this.height = 200,
    this.circle = 200,
    this.fontSize = 28,
    this.colors = const [],
    this.background = const Color(0xFFFFFFFF),
    this.circleColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 2.5,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: height * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    radius,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: circle,
                height: circle,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: height * 0.1),
                padding: EdgeInsets.all(1.0.adaptSize),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: appTheme.white,
                  ),
                ),
                child: Container(
                  width: circle,
                  height: circle,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: circleColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: appTheme.white,
                    ),
                  ),
                  child: CustomImageView(
                    width: circle * 0.5,
                    height: circle * 0.5,
                    fit: BoxFit.contain,
                    imagePath: imagePath,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.08,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: width * 0.6,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                    ),
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
