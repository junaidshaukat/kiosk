import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomCarousel extends StatelessWidget {
  final bool reverse;
  final bool padEnds;
  final int initialPage;
  final List<Cause> items;
  final bool pageSnapping;
  final PageController controller;
  final EdgeInsetsGeometry? margin;
  final Function(int)? onPageChanged;

  const CustomCarousel({
    super.key,
    this.margin,
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
      itemCount: items.length,
      controller: controller,
      pageSnapping: pageSnapping,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        Cause cause = items[index];

        return Container(
          height: 420.v,
          margin: EdgeInsets.symmetric(horizontal: 2.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2.adaptSize,
              color: initialPage == index ? appTheme.primary : appTheme.white,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImageView(
                fit: BoxFit.cover,
                imagePath: cause.imagePath,
              ),
              Text(
                cause.title,
                textAlign: TextAlign.center,
                style: TextStyles.headlineSmall.copyWith(
                  color: appTheme.gray600,
                  fontSize: 18.fSize,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
