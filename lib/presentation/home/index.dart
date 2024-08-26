import 'package:flutter/material.dart';
import '/core/app_export.dart';

export './selection/index.dart';

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
    if (flow == 3) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(gutter),
            child: StaggerColumn(
              children: [
                SizedBox(height: 24.h),
                CustomImageView(
                  imagePath: 'mosque@1'.image.png,
                  height: 258.h,
                  width: 258.h,
                ),
                SizedBox(height: 24.h),
                Text(
                  "lbl_click_to_begin".tr,
                  textAlign: TextAlign.center,
                  style: TextStyles.displayLarge.copyWith(
                    fontSize: 48.fSize,
                    color: appTheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 18.h),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 28.h),
                  decoration: AppDecoration.primary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "lbl_donate_now".tr,
                        style: TextStyles.displayLarge.copyWith(
                          fontSize: 44.fSize,
                          color: appTheme.white,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 48.h),
                Text(
                  "msg_click_here_to_learn".tr,
                  style: TextStyles.displaySmall.copyWith(
                    fontSize: 38.fSize,
                    color: appTheme.yellow800,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(gutter),
            child: StaggerColumn(
              children: [
                SizedBox(height: 34.adaptSize),
                CustomImageView(
                  width: 258.adaptSize,
                  height: 258.adaptSize,
                  imagePath: 'mosque@1'.image.png,
                ),
                SizedBox(height: 24.adaptSize),
                Text(
                  "lbl_click_to_begin".tr,
                  textAlign: TextAlign.center,
                  style: TextStyles.displayLarge.copyWith(
                    fontSize: 96.fSize,
                    color: appTheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 18.adaptSize),
                Container(
                  width: 164.adaptSize,
                  padding: EdgeInsets.symmetric(vertical: 28.adaptSize),
                  decoration: AppDecoration.primary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: InkWell(
                    onTap: () {
                      NavigatorService.push(context, SelectionScreen());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "lbl_donate_now".tr,
                          style: TextStyles.displayLarge.copyWith(
                            fontSize: 44.fSize,
                            color: appTheme.white,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 48.adaptSize),
                Text(
                  "msg_click_here_to_learn".tr,
                  style: TextStyles.displaySmall.copyWith(
                    fontSize: 38.fSize,
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
}
