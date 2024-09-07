import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomCarousel extends StatelessWidget {
  final bool reverse;
  final bool padEnds;
  final double border;
  final double radius;
  final double? height;
  final int initialPage;
  final double? fontSize;
  final List<Cause> items;
  final bool pageSnapping;
  final PageController controller;
  final EdgeInsetsGeometry? margin;
  final Function(int)? onPageChanged;
  final void Function(int)? onPressed;

  const CustomCarousel({
    super.key,
    this.margin,
    this.height,
    this.fontSize,
    this.onPressed,
    this.border = 2,
    this.radius = 2,
    this.onPageChanged,
    this.padEnds = false,
    this.reverse = false,
    this.initialPage = 0,
    this.items = const [],
    required this.controller,
    this.pageSnapping = true,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      reverse: reverse,
      padEnds: padEnds,
      controller: controller,
      itemCount: items.length,
      pageSnapping: pageSnapping,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        Cause cause = items[index];

        return Container(
          height: height,
          margin: margin ?? EdgeInsets.symmetric(horizontal: 2.adaptSize),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              width: border,
              color: initialPage == index ? appTheme.primary : appTheme.white,
            ),
          ),
          child: InkWell(
            onTap: () {
              onPressed!(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  fit: BoxFit.cover,
                  imagePath: cause.imagePath,
                ),
                Text(
                  cause.label,
                  textAlign: TextAlign.center,
                  style: TextStyles.headlineSmall.copyWith(
                    fontSize: fontSize,
                    color: appTheme.gray600,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
