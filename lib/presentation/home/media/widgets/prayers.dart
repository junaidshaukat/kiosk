import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Prayers extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final List<Prayer> prayers;
  final PageController controller;
  final void Function(int)? onPageChanged;

  const Prayers({
    super.key,
    this.width = 0,
    this.height = 0,
    this.radius = 0,
    this.onPageChanged,
    this.prayers = const [],
    required this.controller,
  });

  Widget tile({
    double? gap,
    double? box,
    Color? color,
    String azan = '',
    double? fontSize,
    String iqama = '',
    String prayer = '',
    FontWeight? fontWeight,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: gap),
        SizedBox(
          width: box,
          child: Text(
            prayer,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: box,
          child: Text(
            azan,
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: box,
          child: Text(
            iqama,
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
        SizedBox(width: gap),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: width,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                    color: appTheme.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(radius),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.6,
                        child: Stack(
                          children: [
                            PageView(
                              controller: controller,
                              onPageChanged: onPageChanged,
                              children: List.generate(
                                prayers.length,
                                (index) {
                                  Prayer prayer = prayers[index];
                                  Prayer next = (index + 1) < prayers.length
                                      ? prayers[index + 1]
                                      : prayers[0];

                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: (width * 0.6) * 0.05,
                                      horizontal: (width * 0.6) * 0.08,
                                    ),
                                    decoration: BoxDecoration(
                                      color: appTheme.white,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(radius),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          prayer.prayer,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 2.5.fSize,
                                            color: appTheme.primary,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          prayer.azan,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 3.0.fSize,
                                            color: appTheme.primary,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          'Next Pray: ${next.prayer}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 1.5.fSize,
                                            color: appTheme.primary,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          next.azan,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 2.0.fSize,
                                            color: appTheme.primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              left: 12,
                              bottom: (height * 0.3) * 0.04,
                              child: Center(
                                child: SmoothPageIndicator(
                                  count: prayers.length,
                                  controller: controller,
                                  effect: WormEffect(
                                    strokeWidth: 1,
                                    dotColor: appTheme.gray200,
                                    activeDotColor: appTheme.primary,
                                    radius: (width * 0.6) * 0.04,
                                    spacing: (width * 0.6) * 0.04,
                                    dotWidth: (width * 0.6) * 0.04,
                                    dotHeight: (width * 0.6) * 0.04,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.4,
                        child: CustomImageView(
                          imagePath: 'mosque@3'.image.png,
                          alignment: Alignment.bottomCenter,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: height * 0.3,
                child: Container(
                  width: width,
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    color: appTheme.pale,
                  ),
                  child: tile(
                    azan: 'Azan'.tr,
                    box: width * 0.25,
                    gap: width * 0.10,
                    iqama: 'Iqama'.tr,
                    prayer: 'Prayer'.tr,
                    fontSize: 2.5.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: width,
                  height: height * .6,
                  padding: EdgeInsets.symmetric(vertical: 2.adaptSize),
                  decoration: BoxDecoration(
                    color: appTheme.primary,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(radius),
                    ),
                  ),
                  child: ListView.separated(
                    itemCount: prayers.length,
                    itemBuilder: (context, index) {
                      Prayer prayer = prayers[index];
                      return tile(
                        azan: prayer.azan,
                        box: width * 0.25,
                        gap: width * 0.10,
                        iqama: prayer.iqama,
                        fontSize: 2.2.fSize,
                        prayer: prayer.prayer,
                        color: appTheme.white,
                        fontWeight: FontWeight.w700,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 1.5.adaptSize);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
