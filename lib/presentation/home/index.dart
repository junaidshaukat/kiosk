import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'campaign/index.dart';
export 'amount/index.dart';
export 'payment/index.dart';
export 'review/index.dart';
export 'widgets/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late PreferenceProvider provider;
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 34.v),
              CustomImageView(
                width: 258.adaptSize,
                height: 258.adaptSize,
                imagePath: 'mosque@1'.image.png,
              ),
              SizedBox(height: 24.v),
              Text(
                "lbl_click_to_begin".tr,
                textAlign: TextAlign.center,
                style: TextStyles.displayLarge.copyWith(
                  fontSize: 96.fSize,
                  color: appTheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 18.v),
              Container(
                width: 673.h,
                height: 164.v,
                decoration: AppDecoration.primary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: InkWell(
                  onTap: () {
                    NavigatorService.push(context, const CampaignScreen());
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "lbl_donate_now".tr,
                        style: TextStyles.displayLarge.copyWith(
                          fontSize: 64.fSize,
                          color: appTheme.white,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 48.v),
              Text(
                "msg_click_here_to_learn".tr,
                style: TextStyles.displaySmall.copyWith(
                  fontSize: 36.fSize,
                  color: appTheme.yellow800,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
