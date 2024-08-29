import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => ReviewScreenState();
}

class ReviewScreenState extends State<ReviewScreen> {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomStepper(step: 3),
            CustomDivider(height: 2.v),
            SizedBox(height: 12.v),
            CustomHeader(
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
                          width: 24.adaptSize,
                          height: 24.adaptSize,
                          imagePath: 'caret-left-fill'.icon.svg,
                          color: initialPage == 0
                              ? appTheme.gray600
                              : appTheme.primary,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 420.v,
                          width: double.maxFinite,
                          child: Stack(
                            children: [
                              CustomCarousel(
                                controller: controller,
                                initialPage: initialPage,
                                onPageChanged: (int page) {
                                  setState(() {
                                    initialPage = page;
                                  });
                                },
                                items: [
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
                                ],
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
                          width: 24.adaptSize,
                          height: 24.adaptSize,
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
              height: 2.v,
              offset: const Offset(-1, 0),
            ),
            BottomArea(
              back: true,
              lblNext: "lbl_next",
              lblBack: "lbl_back",
              onBack: () {
                NavigatorService.goBack();
              },
              onNext: () {
                NavigatorService.push(context, const PaymentScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
