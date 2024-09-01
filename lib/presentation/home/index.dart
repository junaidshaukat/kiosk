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
      Future.delayed(const Duration(seconds: 1), () {
        NavigatorService.push(context, const CampaignScreen());
      });
    });
  }

  Widget get icon {
    return CustomImageView(
      width: 258.adaptSize,
      height: 258.adaptSize,
      imagePath: 'mosque@1'.image.png,
    );
  }

  Widget get begin {
    return Text(
      "lbl_click_to_begin".tr,
      textAlign: TextAlign.center,
      style: TextStyles.displayLarge.copyWith(
        fontSize: 44.fSize,
        color: appTheme.primary,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget get donate {
    return Container(
      width: 400.adaptSize,
      height: 128.adaptSize,
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
                fontSize: 48.fSize,
                color: appTheme.white,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get learn {
    return Text(
      "msg_click_here_to_learn".tr,
      style: TextStyles.displaySmall.copyWith(
        fontSize: 32.fSize,
        color: appTheme.yellow800,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget responsive() {
    return Responsive(
      phone: (orientation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 12.v),
            begin,
            SizedBox(height: 12.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: donate,
            ),
            SizedBox(height: 12.v),
            learn
          ],
        );
      },
      tablet: (orientation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 12.v),
            begin,
            SizedBox(height: 12.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: donate,
            ),
            SizedBox(height: 12.v),
            learn
          ],
        );
      },
      kiosk: (orientation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 12.v),
            begin,
            SizedBox(height: 12.v),
            donate,
            SizedBox(height: 12.v),
            learn
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: responsive(),
        ),
      ),
    );
  }
}
