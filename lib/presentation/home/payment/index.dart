import 'package:flutter/material.dart';
import '/core/app_export.dart';

import './method.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
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
              label: "lbl_confirmation".tr,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: 128.adaptSize,
                    height: 128.adaptSize,
                    child: CustomImageView(
                      fit: BoxFit.contain,
                      imagePath: "mosque@2".image.png,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.adaptSize),
                    child: Confirmation(
                      fee: "\$2.75".tr,
                      tax: "\$1.94".tr,
                      amount: "\$30".tr,
                      total: "\$30.34".tr,
                      feeFontSize: 24.adaptSize,
                      taxFontSize: 24.adaptSize,
                      titleFontSize: 24.adaptSize,
                      totalFontSize: 24.adaptSize,
                      amountFontSize: 24.adaptSize,
                      feeLabelFontSize: 24.adaptSize,
                      taxLabelFontSize: 24.adaptSize,
                      title: "Mosque Construction".tr,
                      totalLabelFontSize: 24.adaptSize,
                      amountLabelFontSize: 24.adaptSize,
                    ),
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
                NavigatorService.push(context, const PaymentMethodScreen());
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
              label: "lbl_confirmation".tr,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: 128.adaptSize,
                    height: 128.adaptSize,
                    child: CustomImageView(
                      fit: BoxFit.contain,
                      imagePath: "mosque@2".image.png,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.adaptSize),
                    child: Confirmation(
                      fee: "\$2.75".tr,
                      tax: "\$1.94".tr,
                      amount: "\$30".tr,
                      total: "\$30.34".tr,
                      feeFontSize: 24.adaptSize,
                      taxFontSize: 24.adaptSize,
                      titleFontSize: 24.adaptSize,
                      totalFontSize: 24.adaptSize,
                      amountFontSize: 24.adaptSize,
                      feeLabelFontSize: 24.adaptSize,
                      taxLabelFontSize: 24.adaptSize,
                      title: "Mosque Construction".tr,
                      totalLabelFontSize: 24.adaptSize,
                      amountLabelFontSize: 24.adaptSize,
                    ),
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
                NavigatorService.push(context, const PaymentMethodScreen());
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
              label: "lbl_confirmation".tr,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: CustomImageView(
                        fit: BoxFit.contain,
                        imagePath: "mosque@2".image.png,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(24.adaptSize),
                      child: Confirmation(
                        fee: "\$2.75".tr,
                        tax: "\$1.94".tr,
                        amount: "\$30".tr,
                        total: "\$30.34".tr,
                        feeFontSize: 24.adaptSize,
                        taxFontSize: 24.adaptSize,
                        titleFontSize: 24.adaptSize,
                        totalFontSize: 24.adaptSize,
                        amountFontSize: 24.adaptSize,
                        feeLabelFontSize: 24.adaptSize,
                        taxLabelFontSize: 24.adaptSize,
                        title: "Mosque Construction".tr,
                        totalLabelFontSize: 24.adaptSize,
                        amountLabelFontSize: 24.adaptSize,
                      ),
                    ),
                  )
                ],
              ),
            ),
            CustomDivider(
              height: 2.adaptSize,
              offset: const Offset(-1, 0),
            ),
            BottomArea(
              back: true,
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
                NavigatorService.push(context, const PaymentMethodScreen());
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
