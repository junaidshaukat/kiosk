import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => CampaignScreenState();
}

class CampaignScreenState extends State<CampaignScreen> {
  late PreferenceProvider provider;

  int initialPage = 0;

  final PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.5,
  );

  int flow = 1;

  @override
  void initState() {
    super.initState();
    provider = context.read<PreferenceProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      flow = provider.flow;
      Future.delayed(const Duration(seconds: 1), () {
        NavigatorService.push(context, const AmountScreen());
      });
    });
  }

  Widget responsive() {
    List<Cause> items = [
      Cause(
        index: 0,
        title: 'Mosque Donation'.tr,
        imagePath: "mosque@2".image.png,
      ),
      Cause(
        index: 1,
        title: 'Zakat Donation'.tr,
        imagePath: "zakat".image.png,
      ),
      Cause(
        index: 2,
        title: 'Sadaqah'.tr,
        imagePath: "sadaqah".image.png,
      ),
      Cause(
        index: 3,
        title: 'Food Bank'.tr,
        imagePath: "food_bank".image.png,
      ),
      Cause(
        index: 4,
        title: 'Mosque Donation'.tr,
        imagePath: "mosque@2".image.png,
      ),
      Cause(
        index: 5,
        title: 'Mosque Donation'.tr,
        imagePath: "mosque@2".image.png,
      ),
      Cause(
        index: 6,
        title: 'Mosque Donation'.tr,
        imagePath: "mosque@2".image.png,
      ),
      Cause(
        index: 7,
        title: 'Mosque Donation'.tr,
        imagePath: "mosque@2".image.png,
      ),
    ];

    return Responsive(
      phone: (orientation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomStepper(
              step: 0,
              fontSize: 16.fSize,
              height: 60.adaptSize,
              vertical: 8.adaptSize,
            ),
            CustomDivider(height: 1.v),
            SizedBox(height: 12.v),
            CustomHeader(
              fontSize1: 12.fSize,
              fontSize2: 16.fSize,
              onCancel: () {
                NavigatorService.goBack();
              },
              label: "msg_choose_your_cause".tr,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8.adaptSize,
                  runSpacing: 8.adaptSize,
                  children: List.generate(items.length, (index) {
                    Cause cause = items[index];

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: fdw * 0.40,
                          height: fdw * 0.40,
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            border: Border.all(
                              color: appTheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CustomImageView(
                            fit: BoxFit.cover,
                            imagePath: cause.imagePath,
                          ),
                        ),
                        SizedBox(height: 2.adaptSize),
                        SizedBox(
                          width: fdw * 0.40,
                          child: Text(
                            maxLines: 2,
                            cause.title,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            style: TextStyles.headlineSmall.copyWith(
                              fontSize: 12.fSize,
                              color: appTheme.gray600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                ),
              ),
            ),
            CustomDivider(
              height: 1.adaptSize,
              offset: const Offset(-1, 0),
            ),
            BottomArea(
              fontSize: 14.fSize,
              lblNext: "lbl_next",
              height: 70.adaptSize,
              radius: 4.adaptSize,
              lblWidth: 150.adaptSize,
              imagePath: 'mosque@2'.image.png,
              label: "msg_mosque_construction_in".tr,
              buttonSize: Size(90.adaptSize, 38.adaptSize),
              onNext: () {
                NavigatorService.push(context, const AmountScreen());
              },
            )
          ],
        );
      },
      tablet: (orientation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomStepper(
              step: 0,
              fontSize: 12.fSize,
              height: 100.adaptSize,
              vertical: 8.adaptSize,
            ),
            CustomDivider(height: 2.adaptSize),
            SizedBox(height: 12.adaptSize),
            CustomHeader(
              fontSize1: 14.fSize,
              fontSize2: 16.fSize,
              onCancel: () {
                NavigatorService.goBack();
              },
              label: "msg_choose_your_cause".tr,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8.adaptSize,
                  runSpacing: 8.adaptSize,
                  children: List.generate(items.length, (index) {
                    Cause cause = items[index];

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: fdw * 0.40,
                          height: fdw * 0.40,
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            border: Border.all(
                              color: appTheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CustomImageView(
                            fit: BoxFit.cover,
                            imagePath: cause.imagePath,
                          ),
                        ),
                        SizedBox(height: 2.adaptSize),
                        SizedBox(
                          width: fdw * 0.40,
                          child: Text(
                            maxLines: 2,
                            cause.title,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            style: TextStyles.headlineSmall.copyWith(
                              fontSize: 12.fSize,
                              color: appTheme.gray600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                ),
              ),
            ),
            CustomDivider(
              height: 2.adaptSize,
              offset: const Offset(-1, 0),
            ),
            BottomArea(
              fontSize: 18.fSize,
              lblNext: "lbl_next",
              height: 110.adaptSize,
              radius: 8.adaptSize,
              lblWidth: 350.adaptSize,
              imagePath: 'mosque@2'.image.png,
              label: "msg_mosque_construction_in".tr,
              buttonSize: Size(120.adaptSize, 58.adaptSize),
              onNext: () {
                NavigatorService.push(context, const AmountScreen());
              },
            )
          ],
        );
      },
      kiosk: (orientation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomStepper(
              step: 0,
              fontSize: 16.fSize,
              height: 128.adaptSize,
              vertical: 8.adaptSize,
            ),
            CustomDivider(height: 2.adaptSize),
            SizedBox(height: 12.adaptSize),
            CustomHeader(
              fontSize1: 32.fSize,
              fontSize2: 36.fSize,
              onCancel: () {
                NavigatorService.goBack();
              },
              label: "msg_choose_your_cause".tr,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (initialPage == 7) {
                            setState(() {
                              initialPage = 6;
                            });
                          } else {
                            setState(() {
                              controller.previousPage(
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 100),
                              );
                            });
                          }
                        },
                        child: CustomImageView(
                          width: 58.adaptSize,
                          height: 58.adaptSize,
                          imagePath: 'caret-left-fill'.icon.svg,
                          color: initialPage == 0
                              ? appTheme.gray600
                              : appTheme.primary,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 420.adaptSize,
                          width: double.maxFinite,
                          child: Stack(
                            children: [
                              CustomCarousel(
                                items: items,
                                controller: controller,
                                initialPage: initialPage,
                                onPageChanged: (int page) {
                                  setState(() {
                                    initialPage = page;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (initialPage == 6) {
                              setState(() {
                                initialPage = 7;
                              });
                            } else {
                              setState(() {
                                controller.nextPage(
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 100),
                                );
                              });
                            }
                          });
                        },
                        child: CustomImageView(
                          width: 58.adaptSize,
                          height: 58.adaptSize,
                          imagePath: 'caret-right-fill'.icon.svg,
                          color: initialPage == 7
                              ? appTheme.gray600
                              : appTheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomDivider(
              height: 2.adaptSize,
              offset: const Offset(-1, 0),
            ),
            BottomArea(
              fontSize: 36.fSize,
              lblNext: "lbl_next",
              radius: 8.adaptSize,
              height: 138.adaptSize,
              lblWidth: 500.adaptSize,
              imagePath: 'mosque@2'.image.png,
              label: "msg_mosque_construction_in".tr,
              buttonSize: Size(200.adaptSize, 78.adaptSize),
              onNext: () {
                NavigatorService.push(context, const AmountScreen());
              },
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
        body: responsive(),
      ),
    );
  }
}
