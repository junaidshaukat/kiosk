import 'package:flutter/material.dart';
import '/core/app_export.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => PaymentMethodScreenState();
}

class PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final int step = 2;

  late PreferenceProvider provider;

  int initialPage = 0;

  final PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.5,
  );

  int flow = 1;

  String amount = '00';

  @override
  void initState() {
    super.initState();
    provider = context.read<PreferenceProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      flow = provider.flow;
    });
  }

  void tapToPay() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        AlertDialog dialog = AlertDialog(
          title: Text('lbl_please_tap_to_pay'.tr),
          content: Center(
            child: CustomImageView(
              width: 300.adaptSize,
              height: 300.adaptSize,
              imagePath: 'finger-print'.icon.svg,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                NavigatorService.goBack();
              },
              child: Text('lbl_cancel'.tr),
            ),
          ],
        );

        Future.delayed(const Duration(seconds: 3), () {
          if (context.mounted) {
            NavigatorService.push(context, const ReviewScreen());
          }
        });

        return dialog;
      },
    );
  }

  void confirmTransaction() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        AlertDialog dialog = AlertDialog(
          title: Text('lbl_confirm_transaction'.tr),
          content: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    text: "lbl_total".tr,
                    style: TextStyles.displayLarge.copyWith(
                      fontSize: 24.fSize,
                      color: appTheme.lime800,
                      fontWeight: FontWeight.w700,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ": ".tr,
                      ),
                      TextSpan(
                        text: "\$30.35".tr,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "lbl_debit".tr,
                    style: TextStyles.displayLarge.copyWith(
                      fontSize: 24.fSize,
                      color: appTheme.lime800,
                      fontWeight: FontWeight.w700,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ": ".tr,
                      ),
                      TextSpan(
                        text: "**** - 0000".tr,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                NavigatorService.goBack();
              },
              child: Text('lbl_cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                NavigatorService.goBack();
                tapToPay();
              },
              child: Text('lbl_confirm'.tr),
            ),
          ],
        );

        return dialog;
      },
    );
  }

  void scanQrCode() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        AlertDialog dialog = AlertDialog(
          title: Text('lbl_please_scan_qr_code'.tr),
          content: Center(
            child: CustomImageView(
              width: 300.adaptSize,
              height: 300.adaptSize,
              imagePath: 'qr-code'.icon.svg,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                NavigatorService.goBack();
              },
              child: Text('lbl_cancel'.tr),
            ),
          ],
        );

        Future.delayed(const Duration(seconds: 3), () {
          NavigatorService.goBack();
          confirmTransaction();
        });

        return dialog;
      },
    );
  }

  void onTapCard() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        AlertDialog dialog = AlertDialog(
          title: Text('lbl_please_insert_card'.tr),
          content: Center(
            child: Lottie.asset(
              height: 300.adaptSize,
              width: 300.adaptSize,
              'card_insert'.lottie.json,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                NavigatorService.goBack();
              },
              child: Text('lbl_cancel'.tr),
            ),
          ],
        );

        Future.delayed(const Duration(seconds: 3), () {
          NavigatorService.goBack();
          scanQrCode();
        });

        return dialog;
      },
    );
  }

  Widget responsive() {
    return Responsive(
      phone: (orientation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomStepper(
              step: step,
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
              label: "lbl_choose_payment_type".tr,
            ),
            Expanded(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "lbl_total".tr,
                      style: TextStyles.displayLarge.copyWith(
                        fontSize: 24.fSize,
                        color: appTheme.lime800,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ": ".tr,
                        ),
                        TextSpan(
                          text: "\$30.35".tr,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.adaptSize),
                  Wrap(
                    spacing: 12.adaptSize,
                    runSpacing: 12.adaptSize,
                    children: [
                      CustomImageView(
                        onTap: onTapCard,
                        width: 140.adaptSize,
                        height: 140.adaptSize,
                        imagePath: 'credit'.icon.svg,
                      ),
                      CustomImageView(
                        onTap: onTapCard,
                        width: 140.adaptSize,
                        height: 140.adaptSize,
                        imagePath: 'debit'.icon.svg,
                      ),
                      CustomImageView(
                        onTap: onTapCard,
                        width: 140.adaptSize,
                        height: 140.adaptSize,
                        imagePath: 'apple-pay'.icon.svg,
                      ),
                      CustomImageView(
                        onTap: onTapCard,
                        width: 140.adaptSize,
                        height: 140.adaptSize,
                        imagePath: 'google-pay'.icon.svg,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomDivider(
              height: 1.adaptSize,
              offset: const Offset(-1, 0),
            ),
            BottomArea(
              back: true,
              next: false,
              fontSize: 14.fSize,
              lblBack: "lbl_back",
              radius: 4.adaptSize,
              height: 70.adaptSize,
              lblNext: "lbl_confirm",
              buttonSize: Size(90.adaptSize, 38.adaptSize),
              onBack: () {
                NavigatorService.goBack();
              },
              onNext: () {
                NavigatorService.push(context, const PaymentScreen());
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
              step: step,
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
              label: "lbl_choose_payment_type".tr,
            ),
            Expanded(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "lbl_total".tr,
                      style: TextStyles.displayLarge.copyWith(
                        fontSize: 24.fSize,
                        color: appTheme.lime800,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ": ".tr,
                        ),
                        TextSpan(
                          text: "\$30.35".tr,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.adaptSize),
                  Wrap(
                    spacing: 12.adaptSize,
                    runSpacing: 12.adaptSize,
                    children: [
                      CustomImageView(
                        onTap: onTapCard,
                        width: 140.adaptSize,
                        height: 140.adaptSize,
                        imagePath: 'credit'.icon.svg,
                      ),
                      CustomImageView(
                        onTap: onTapCard,
                        width: 140.adaptSize,
                        height: 140.adaptSize,
                        imagePath: 'debit'.icon.svg,
                      ),
                      CustomImageView(
                        onTap: onTapCard,
                        width: 140.adaptSize,
                        height: 140.adaptSize,
                        imagePath: 'apple-pay'.icon.svg,
                      ),
                      CustomImageView(
                        onTap: onTapCard,
                        width: 140.adaptSize,
                        height: 140.adaptSize,
                        imagePath: 'google-pay'.icon.svg,
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
              back: true,
              next: false,
              fontSize: 18.fSize,
              lblBack: "lbl_back",
              radius: 8.adaptSize,
              height: 110.adaptSize,
              lblNext: "lbl_confirm",
              buttonSize: Size(120.adaptSize, 58.adaptSize),
              onBack: () {
                NavigatorService.goBack();
              },
              onNext: () {
                NavigatorService.push(context, const PaymentScreen());
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
              step: step,
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
              label: "lbl_choose_payment_type".tr,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "lbl_total".tr,
                      style: TextStyles.displayLarge.copyWith(
                        fontSize: 64.fSize,
                        color: appTheme.lime800,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ": ".tr,
                        ),
                        TextSpan(
                          text: "\$30.35".tr,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.adaptSize),
                  Wrap(
                    spacing: 24.adaptSize,
                    runSpacing: 12.adaptSize,
                    children: [
                      CustomImageView(
                        onTap: onTapCard,
                        width: 200.adaptSize,
                        height: 200.adaptSize,
                        imagePath: 'credit'.icon.svg,
                      ),
                      CustomImageView(
                        onTap: onTapCard,
                        width: 200.adaptSize,
                        height: 200.adaptSize,
                        imagePath: 'debit'.icon.svg,
                      ),
                      CustomImageView(
                        onTap: onTapCard,
                        width: 200.adaptSize,
                        height: 200.adaptSize,
                        imagePath: 'apple-pay'.icon.svg,
                      ),
                      CustomImageView(
                        onTap: onTapCard,
                        width: 200.adaptSize,
                        height: 200.adaptSize,
                        imagePath: 'google-pay'.icon.svg,
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
              back: true,
              next: false,
              fontSize: 36.fSize,
              radius: 8.adaptSize,
              lblBack: "lbl_back",
              height: 138.adaptSize,
              lblNext: "lbl_confirm",
              lblWidth: 500.adaptSize,
              buttonSize: Size(200.adaptSize, 78.adaptSize),
              onBack: () {
                NavigatorService.goBack();
              },
              onNext: () {
                NavigatorService.push(context, const PaymentScreen());
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
