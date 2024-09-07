import 'package:flutter/material.dart';
import '/core/app_export.dart';

import './widgets/export.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => MediaScreenState();
}

class MediaScreenState extends State<MediaScreen> {
  late PreferenceProvider provider;
  int initialPage = 0;
  final PageController controller = PageController(initialPage: 0);

  Prayer currentPrayer = Prayer(
    index: -1,
    azan: '',
    iqama: '',
    prayer: ''.tr,
  );

  DateTime parseTime(String timeStr, DateTime referenceDate) {
    final format = DateFormat("hh:mm aa");
    final parsedTime = format.parse(timeStr);
    return parsedTime.copyWith(
      year: referenceDate.year,
      month: referenceDate.month,
      day: referenceDate.day,
    );
  }

  bool isFriday(DateTime date) {
    return date.weekday == DateTime.friday;
  }

  Prayer getCurrentAzan(List<Prayer> prayers, DateTime currentDateTime) {
    Prayer? closestPrayer;

    for (var prayer in prayers) {
      if (isFriday(currentDateTime)) {
        final azanTime = parseTime(prayer.azan, currentDateTime);

        if (azanTime.isBefore(currentDateTime) ||
            azanTime.isAtSameMomentAs(currentDateTime)) {
          if (closestPrayer == null ||
              azanTime
                  .isAfter(parseTime(closestPrayer.azan, currentDateTime))) {
            closestPrayer = prayer;
          }
        }
      } else {
        if (prayer.index != 1) {
          final azanTime = parseTime(prayer.azan, currentDateTime);

          if (azanTime.isBefore(currentDateTime) ||
              azanTime.isAtSameMomentAs(currentDateTime)) {
            if (closestPrayer == null ||
                azanTime
                    .isAfter(parseTime(closestPrayer.azan, currentDateTime))) {
              closestPrayer = prayer;
            }
          }
        }
      }
    }

    if (closestPrayer == null) {
      return Prayer(
        index: -1,
        azan: '',
        iqama: '',
        prayer: ''.tr,
      );
    } else {
      return closestPrayer;
    }
  }

  List<Prayer> prayers = [
    Prayer(
      index: 0,
      azan: '4:20 AM',
      iqama: '4:30 AM',
      prayer: 'lbl_fajr'.tr,
    ),
    Prayer(
      index: 1,
      azan: '1:30 PM',
      iqama: '1:45 PM',
      prayer: 'lbl_jumuah'.tr,
    ),
    Prayer(
      index: 2,
      azan: '1:30 PM',
      iqama: '1:45 PM',
      prayer: 'lbl_dhuhar'.tr,
    ),
    Prayer(
      index: 3,
      azan: '4:36 PM',
      iqama: '4:50 PM',
      prayer: 'lbl_asr'.tr,
    ),
    Prayer(
      index: 4,
      azan: '6:24 PM',
      iqama: '6:40 PM',
      prayer: 'lbl_magrib'.tr,
    ),
    Prayer(
      index: 5,
      azan: '7:49 PM',
      iqama: '7:50 PM',
      prayer: 'lbl_isha'.tr,
    ),
  ];

  @override
  void initState() {
    super.initState();
    provider = context.read<PreferenceProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  Widget get body {
    return Layout(
      child: (orientation) {
        return Column(
          children: [
            CustomAppbar(
              back: false,
              fontSize: 2.5.fSize,
              height: 14.adaptSize,
              btnFontSize: 2.5.fSize,
              icon: 'close-circle'.icon.svg,
              label: 'Masjid Al Adam Canada',
              imagePath: 'mosque@1'.image.png,
              onNext: () {
                NavigatorService.goBack();
              },
            ),
            const CustomDivider(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(2.adaptSize),
                child: Column(
                  children: [
                    Wrap(
                      spacing: 2.adaptSize,
                      runSpacing: 2.adaptSize,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.center,
                      children: [
                        WidgetCard(
                          width: 45.adaptSize,
                          height: 60.adaptSize,
                          radius: 2.0.adaptSize,
                          background: appTheme.primary,
                          child: Weather(
                            hum: '54 %',
                            city: 'Canada',
                            weather: 'Cloudy',
                            temperature: '29°',
                            humidity: 'Hum'.tr,
                            width: 45.adaptSize,
                            height: 60.adaptSize,
                            windSpeed: '10 km/h',
                            today: DateTime.now().todayDDMM,
                          ),
                        ),
                        WidgetCard(
                          width: 45.adaptSize,
                          height: 60.adaptSize,
                          radius: 2.0.adaptSize,
                          background: appTheme.white,
                          child: Clock(
                            city: 'Canada',
                            width: 45.adaptSize,
                            height: 60.adaptSize,
                            onTimeChanged: (datetime) {
                              setState(() {
                                currentPrayer =
                                    getCurrentAzan(prayers, datetime);
                                if (currentPrayer.index != initialPage) {
                                  initialPage = currentPrayer.index;
                                  controller.animateToPage(
                                    initialPage,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                }
                              });
                            },
                          ),
                        ),
                        WidgetCard(
                          width: 45.adaptSize,
                          height: 60.adaptSize,
                          radius: 2.0.adaptSize,
                          background: appTheme.white,
                          child: Donation(
                            width: 45.adaptSize,
                            height: 60.adaptSize,
                            progress: 75.00,
                            project: "Parking Project",
                            targetedAmount: '\$1500000',
                            raisedAmount: '\$35879.13',
                            remainingAmount: '\$1464120.87',
                          ),
                        ),
                        WidgetCard(
                          width: 45.adaptSize,
                          height: 60.adaptSize,
                          radius: 2.0.adaptSize,
                          background: appTheme.white,
                          child: Prayers(
                            prayers: prayers,
                            width: 45.adaptSize,
                            height: 60.adaptSize,
                            radius: 2.0.adaptSize,
                            controller: controller,
                            onPageChanged: (page) {
                              setState(() {
                                initialPage = page;
                                controller.animateToPage(
                                  initialPage,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body,
      ),
    );
  }
}
