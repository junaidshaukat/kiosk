import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'media/index.dart';
export 'widgets/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String amount = '0';

  late PreferenceProvider provider;
  TextEditingController emailController = TextEditingController();

  List<Cause> items = [
    Cause(
      label: 'Mosque Donation',
      imagePath: 'mosque'.icon.svg,
      circleColor: appTheme.green228,
      colors: [
        appTheme.green228,
        appTheme.green16,
      ],
    ),
    Cause(
      label: 'Mosque Donation',
      circleColor: appTheme.lime228,
      imagePath: 'donation'.icon.svg,
      colors: [
        appTheme.lime228,
        appTheme.lime16,
      ],
    ),
    Cause(
      label: 'Mosque Donation',
      imagePath: 'mosque'.icon.svg,
      circleColor: appTheme.yellow16,
      colors: [
        appTheme.yellow288,
        appTheme.yellow16,
      ],
    ),
    Cause(
      label: 'Mosque Donation',
      imagePath: 'mosque'.icon.svg,
      circleColor: appTheme.green228,
      colors: [
        appTheme.green228,
        appTheme.green16,
      ],
    ),
    Cause(
      label: 'Mosque Donation',
      imagePath: 'mosque'.icon.svg,
      circleColor: appTheme.green228,
      colors: [
        appTheme.green228,
        appTheme.green16,
      ],
    ),
    Cause(
      label: 'Mosque Donation',
      imagePath: 'mosque'.icon.svg,
      circleColor: appTheme.green228,
      colors: [
        appTheme.green228,
        appTheme.green16,
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    provider = context.read<PreferenceProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  Widget input({
    required String hintText,
    required TextEditingController controller,
    required TextInputAction textInputAction,
    required TextInputType keyboardType,
  }) {
    return Input(
      hintText: hintText,
      controller: controller,
      keyboardType: keyboardType,
      fillColor: appTheme.gray100,
      textInputAction: textInputAction,
      style: TextStyles.bodyLarge.copyWith(
        fontSize: 2.5.fSize,
      ),
      hintStyle: TextStyles.bodyLarge.copyWith(
        fontSize: 2.5.fSize,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 1.8.h,
        vertical: 2.5.v,
      ),
    );
  }

  void onPressedCard(Cause cause, int step) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.adaptSize),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return PopScope(
              canPop: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (step == 1) ...[
                    GestureDetector(
                      onTap: () {
                        NavigatorService.goBack();
                      },
                      child: Container(
                        width: 12.adaptSize,
                        height: 8.adaptSize,
                        decoration: BoxDecoration(
                          color: appTheme.unselect,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4.adaptSize),
                            bottomRight: Radius.circular(4.adaptSize),
                          ),
                        ),
                        child: Center(
                          child: CustomImageView(
                            width: 4.adaptSize,
                            height: 4.adaptSize,
                            fit: BoxFit.contain,
                            imagePath: 'close'.icon.svg,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.adaptSize),
                    // CustomCard(
                    //   label: cause.label,
                    //   fontSize: 1.5.fSize,
                    //   width: 35.adaptSize,
                    //   height: 25.adaptSize,
                    //   circle: 20.adaptSize,
                    //   colors: cause.colors,
                    //   imagePath: cause.imagePath,
                    //   circleColor: cause.circleColor,
                    // ),

                    SizedBox(height: 2.adaptSize),
                    Keyboard(
                      amount: amount,
                      gap: 2.0.adaptSize,
                      hintFontSize: 3.5.fSize,
                      labelFontSize: 4.5.fSize,
                      amountFontSize: 4.5.fSize,
                      size: Size(12.adaptSize, 10.adaptSize),
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.adaptSize,
                        vertical: 2.adaptSize,
                      ),
                      constraints: BoxConstraints(
                        maxWidth: 80.adaptSize,
                        minWidth: 80.adaptSize,
                      ),
                      onPressed: (event, value) {
                        if (event == KeyboardEvent.clear) {
                          setState(() {
                            amount = '0';
                          });
                        } else if (event == KeyboardEvent.pop) {
                          setState(() {
                            amount = value.remove;
                          });
                        } else if (event == KeyboardEvent.fixed) {
                          setState(() {
                            amount = value;
                          });
                        } else if (event == KeyboardEvent.number) {
                          setState(() {
                            amount = value.number;
                          });
                        } else if (event == KeyboardEvent.dot) {
                          setState(() {
                            amount = amount.isFloat;
                          });
                        } else if (event == KeyboardEvent.ok) {
                          setState(() {
                            step = 2;
                          });

                          Future.delayed(const Duration(seconds: 5), () {
                            if (step == 2) {
                              setState(() {
                                step = 3;
                              });
                            }
                          });
                        }
                      },
                    ),
                    SizedBox(height: 2.adaptSize),
                    const CustomDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImageView(
                          width: 10.adaptSize,
                          height: 10.adaptSize,
                          fit: BoxFit.contain,
                          imagePath: 'mosque@1'.image.png,
                        ),
                        SizedBox(width: 2.adaptSize),
                        Text(
                          'Masjid Al Adam Canada',
                          textAlign: TextAlign.center,
                          style: TextStyles.headlineSmall.copyWith(
                            fontSize: 3.5.fSize,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                  if (step == 2) ...[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          step = 1;
                        });
                      },
                      child: Container(
                        width: 12.adaptSize,
                        height: 8.adaptSize,
                        decoration: BoxDecoration(
                          color: appTheme.unselect,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4.adaptSize),
                            bottomRight: Radius.circular(4.adaptSize),
                          ),
                        ),
                        child: Center(
                          child: CustomImageView(
                            width: 4.adaptSize,
                            height: 4.adaptSize,
                            fit: BoxFit.contain,
                            imagePath: 'chevron-left'.icon.svg,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.adaptSize),
                    Text(
                      'lbl_please_insert_card'.tr,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyles.displayMedium.copyWith(
                        fontSize: 3.5.fSize,
                        color: appTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2.adaptSize),
                    Center(
                      child: Lottie.asset(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        'card_insert'.lottie.json,
                      ),
                    )
                  ],
                  if (step == 3) ...[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          step = 2;
                        });
                      },
                      child: Container(
                        width: 12.adaptSize,
                        height: 8.adaptSize,
                        decoration: BoxDecoration(
                          color: appTheme.unselect,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4.adaptSize),
                            bottomRight: Radius.circular(4.adaptSize),
                          ),
                        ),
                        child: Center(
                          child: CustomImageView(
                            width: 4.adaptSize,
                            height: 4.adaptSize,
                            fit: BoxFit.contain,
                            imagePath: 'chevron-left'.icon.svg,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.adaptSize),
                    Text(
                      'lbl_please_tap_to_pay'.tr,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyles.displayMedium.copyWith(
                        fontSize: 3.5.fSize,
                        color: appTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2.adaptSize),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            step = 4;
                          });
                        },
                        child: CustomImageView(
                          width: 30.adaptSize,
                          height: 30.adaptSize,
                          imagePath: 'finger-print'.icon.svg,
                        ),
                      ),
                    )
                  ],
                  if (step == 4) ...[
                    GestureDetector(
                      onTap: () {
                        NavigatorService.goBack();
                      },
                      child: Container(
                        width: 12.adaptSize,
                        height: 8.adaptSize,
                        decoration: BoxDecoration(
                          color: appTheme.unselect,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4.adaptSize),
                            bottomRight: Radius.circular(4.adaptSize),
                          ),
                        ),
                        child: Center(
                          child: CustomImageView(
                            width: 4.adaptSize,
                            height: 4.adaptSize,
                            fit: BoxFit.contain,
                            imagePath: 'close'.icon.svg,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.adaptSize),
                    CustomImageView(
                      width: 12.adaptSize,
                      height: 12.adaptSize,
                      color: appTheme.primary,
                      imagePath: 'check-circle'.icon.svg,
                    ),
                    SizedBox(height: 3.adaptSize),
                    Text(
                      'msg_transaction_completed_successfully'.tr,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyles.displayMedium.copyWith(
                        fontSize: 3.5.fSize,
                        color: appTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.adaptSize),
                    SizedBox(
                      width: 60.adaptSize,
                      child: input(
                        hintText: "lbl_email".tr,
                        controller: emailController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    SizedBox(height: 4.adaptSize),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImageView(
                          width: 8.adaptSize,
                          height: 8.adaptSize,
                          fit: BoxFit.contain,
                          imagePath: 'receipt'.icon.svg,
                        ),
                        SizedBox(width: 4.adaptSize),
                        CustomImageView(
                          width: 8.adaptSize,
                          height: 8.adaptSize,
                          fit: BoxFit.contain,
                          imagePath: 'print'.icon.svg,
                        ),
                        SizedBox(width: 4.adaptSize),
                        CustomImageView(
                          width: 8.adaptSize,
                          height: 8.adaptSize,
                          fit: BoxFit.contain,
                          imagePath: 'anonymous'.icon.svg,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.adaptSize),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
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
              icon: 'play'.icon.svg,
              btnFontSize: 2.5.fSize,
              label: 'Masjid Al Adam Canada',
              imagePath: 'mosque@1'.image.png,
              onNext: () {
                NavigatorService.push(context, const MediaScreen());
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
                      children: List.generate(items.length, (index) {
                        Cause cause = items[index];

                        return CustomCard(
                          label: cause.label,
                          width: 45.adaptSize,
                          fontSize: 2.8.fSize,
                          height: 40.adaptSize,
                          circle: 28.adaptSize,
                          colors: cause.colors,
                          imagePath: cause.imagePath,
                          circleColor: cause.circleColor,
                          onPressed: () {
                            onPressedCard(cause, 1);
                          },
                        );
                      }),
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
