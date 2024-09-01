import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AmountScreen extends StatefulWidget {
  const AmountScreen({super.key});

  @override
  State<AmountScreen> createState() => AmountScreenState();
}

class AmountScreenState extends State<AmountScreen> {
  final int step = 1;
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
      Future.delayed(const Duration(seconds: 1), () {
        NavigatorService.push(context, const PaymentScreen());
      });
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
              label: "".tr,
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
                  Keyboard(
                    amount: amount,
                    radius: 4.adaptSize,
                    hintFontSize: 14.fSize,
                    labelFontSize: 18.fSize,
                    amountFontSize: 24.fSize,
                    size1: Size(50.adaptSize, 40.adaptSize),
                    size2: Size(40.adaptSize, 40.adaptSize),
                    size3: Size(40.adaptSize, 97.adaptSize),
                    constraints: BoxConstraints(maxWidth: fdw * 0.90),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.adaptSize,
                      vertical: 12.adaptSize,
                    ),
                    onPressed: (event, val) {
                      if (event == KeyboardEvent.fixed) {
                        amount = val;
                        setState(() {});
                      }
                      console.log((event, val));
                    },
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
              label: "msg_enter_your_own_amount".tr,
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
                  Keyboard(
                    amount: amount,
                    radius: 4.adaptSize,
                    hintFontSize: 14.fSize,
                    labelFontSize: 18.fSize,
                    amountFontSize: 24.fSize,
                    size1: Size(50.adaptSize, 40.adaptSize),
                    size2: Size(40.adaptSize, 40.adaptSize),
                    size3: Size(40.adaptSize, 97.adaptSize),
                    constraints: BoxConstraints(maxWidth: fdw * 0.90),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.adaptSize,
                      vertical: 12.adaptSize,
                    ),
                    onPressed: (event, val) {
                      if (event == KeyboardEvent.fixed) {
                        amount = val;
                        setState(() {});
                      }
                      console.log((event, val));
                    },
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
              label: "".tr,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 12.adaptSize),
                        Keyboard(
                          amount: amount,
                          radius: 8.adaptSize,
                          hintFontSize: 28.fSize,
                          labelFontSize: 40.fSize,
                          amountFontSize: 40.fSize,
                          size1: Size(((fdw * 0.45) * 0.25).adaptSize,
                              ((fdw * 0.45) * 0.15).adaptSize),
                          size2: Size(((fdw * 0.45) * 0.20).adaptSize,
                              ((fdw * 0.45) * 0.15).adaptSize),
                          size3: Size(((fdw * 0.45) * 0.20).adaptSize,
                              ((fdw * 0.45) * 0.35).adaptSize),
                          constraints: BoxConstraints(maxWidth: fdw * 0.45),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.adaptSize,
                            vertical: 24.adaptSize,
                          ),
                          onPressed: (event, val) {
                            if (event == KeyboardEvent.fixed) {
                              amount = val;
                              setState(() {});
                            }
                            console.log((event, val));
                          },
                        ),
                      ],
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
