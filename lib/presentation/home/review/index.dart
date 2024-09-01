import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => ReviewScreenState();
}

class ReviewScreenState extends State<ReviewScreen> {
  final int step = 3;

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
    Widget child = Responsive(
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
            SizedBox(height: 12.v),
            CustomHeader(
              fontSize1: 12.fSize,
              fontSize2: 16.fSize,
              onCancel: () {
                NavigatorService.goBack();
              },
              label: "lbl_review".tr,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 128.adaptSize,
                    height: 128.adaptSize,
                    child: CustomImageView(
                      fit: BoxFit.contain,
                      imagePath: "check-circle".icon.svg,
                    ),
                  ),
                  SizedBox(height: 24.adaptSize),
                  Text(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    "msg_transaction_completed_successfully".tr,
                    style: TextStyles.headlineSmall.copyWith(
                      fontSize: 24.fSize,
                      color: appTheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  )
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 128.adaptSize,
                    height: 128.adaptSize,
                    child: CustomImageView(
                      fit: BoxFit.contain,
                      imagePath: "check-circle".icon.svg,
                    ),
                  ),
                  SizedBox(height: 24.adaptSize),
                  Text(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    "msg_transaction_completed_successfully".tr,
                    style: TextStyles.headlineSmall.copyWith(
                      fontSize: 24.fSize,
                      color: appTheme.primary,
                      fontWeight: FontWeight.w700,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.adaptSize,
                    height: 150.adaptSize,
                    child: CustomImageView(
                      fit: BoxFit.contain,
                      imagePath: "check-circle".icon.svg,
                    ),
                  ),
                  SizedBox(height: 24.adaptSize),
                  Text(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    "msg_transaction_completed_successfully".tr,
                    style: TextStyles.headlineSmall.copyWith(
                      fontSize: 48.fSize,
                      color: appTheme.primary,
                      fontWeight: FontWeight.w700,
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
            )
          ],
        );
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      NavigatorService.popAndPushNamed(AppRoutes.home);
    });
    return child;
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
