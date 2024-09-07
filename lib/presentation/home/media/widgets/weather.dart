import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Weather extends StatelessWidget {
  final double width;
  final double height;
  final String city;
  final String today;
  final String temperature;
  final String windSpeed;
  final String weather;
  final String humidity;
  final String hum;

  const Weather({
    super.key,
    this.width = 0,
    this.height = 0,
    this.city = '',
    this.today = '',
    this.weather = '',
    this.temperature = '',
    this.humidity = '',
    this.hum = '',
    this.windSpeed = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(
            horizontal: 2.adaptSize,
            vertical: 2.adaptSize,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImageView(
                          color: appTheme.white,
                          imagePath: 'location'.icon.svg,
                        ),
                        SizedBox(width: 0.6.adaptSize),
                        Text(
                          city,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 2.5.fSize,
                            color: appTheme.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 0.6.adaptSize),
                        CustomImageView(
                          color: appTheme.white,
                          imagePath: 'chevron-down'.icon.svg,
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomImageView(
                      color: appTheme.white,
                      imagePath: 'location'.icon.svg,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: height * 0.1,
                child: CustomImageView(
                  width: height * 0.25,
                  height: height * 0.25,
                  imagePath: 'cloud'.icon.svg,
                ),
              ),
              Positioned(
                top: height * 0.35,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 1.adaptSize,
                    horizontal: 2.adaptSize,
                  ),
                  decoration: BoxDecoration(
                    color: appTheme.white.withOpacity(0.25),
                    border: Border.all(
                      color: appTheme.white.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(0.8.adaptSize),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        today,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 2.0.fSize,
                          color: appTheme.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 0.8.adaptSize),
                      Text(
                        temperature,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 4.0.fSize,
                          color: appTheme.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 0.8.adaptSize),
                      Text(
                        weather,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 2.0.fSize,
                          color: appTheme.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 0.8.adaptSize),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 2.0.adaptSize),
                          CustomImageView(
                            color: appTheme.white,
                            imagePath: 'wind'.icon.svg,
                          ),
                          SizedBox(width: 0.8.adaptSize),
                          Text(
                            weather,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 2.0.fSize,
                              color: appTheme.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 2.0.adaptSize),
                          Text(
                            '|'.tr,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 2.0.fSize,
                              color: appTheme.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 2.0.adaptSize),
                          Text(
                            windSpeed,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 2.0.fSize,
                              color: appTheme.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 2.0.adaptSize),
                        ],
                      ),
                      SizedBox(height: 1.0.adaptSize),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 2.0.adaptSize),
                          CustomImageView(
                            color: appTheme.white,
                            imagePath: 'humidity'.icon.svg,
                          ),
                          SizedBox(width: 0.8.adaptSize),
                          Text(
                            humidity,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 2.0.fSize,
                              color: appTheme.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 2.0.adaptSize),
                          Text(
                            '|'.tr,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 2.0.fSize,
                              color: appTheme.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 2.0.adaptSize),
                          Text(
                            hum,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 2.0.fSize,
                              color: appTheme.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 2.0.adaptSize),
                        ],
                      ),
                      SizedBox(height: 0.8.adaptSize),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: height * 0.02,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 1.adaptSize,
                    horizontal: 2.adaptSize,
                  ),
                  decoration: BoxDecoration(
                    color: appTheme.white,
                    borderRadius: BorderRadius.circular(0.4.adaptSize),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'lbl_forecast_report'.tr,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 2.0.fSize,
                          color: appTheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 0.8.adaptSize),
                      CustomImageView(
                        color: appTheme.primary,
                        imagePath: 'chevron-right'.icon.svg,
                      )
                    ],
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
