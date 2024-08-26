import 'package:flutter/material.dart';
import '/core/app_export.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => SelectionScreenState();
}

class SelectionScreenState extends State<SelectionScreen> {
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
                SizedBox(height: 24.h),
                SizedBox(
                  height: 114.h,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 84.h,
                          width: 800.h,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onPrimary,
                            boxShadow: [
                              BoxShadow(
                                color: appTheme.black900.withOpacity(0.25),
                                spreadRadius: 2.h,
                                blurRadius: 2.h,
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          height: 86.h,
                          margin: EdgeInsets.symmetric(horizontal: 60.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 86.h,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 24.h,
                                          margin: EdgeInsets.only(left: 22.h),
                                          decoration: AppDecoration
                                              .outlinePrimary
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder12,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                height: 20.h,
                                                width: 20.h,
                                                decoration: BoxDecoration(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10.h,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: SizedBox(
                                          width: 68.h,
                                          child: Text(
                                            "lbl_campaign".tr,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyles.headlineSmall,
                                          ),
                                        ),
                                      ),
                                      IntrinsicHeight(
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: SizedBox(
                                            height: 20.h,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Spacer(),
                                                Container(
                                                  height: 6.h,
                                                  width: 158.h,
                                                  decoration: BoxDecoration(
                                                    color: appTheme.blueGray100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      3.h,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 20.h,
                                                  width: 20.h,
                                                  margin: EdgeInsets.only(
                                                      left: 14.h),
                                                  decoration: BoxDecoration(
                                                    color: appTheme.blueGray100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10.h,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 6.h,
                                                  width: 158.h,
                                                  margin: EdgeInsets.only(
                                                      left: 12.h),
                                                  decoration: BoxDecoration(
                                                    color: appTheme.blueGray100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      3.h,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 20.h,
                                                  width: 20.h,
                                                  margin: EdgeInsets.only(
                                                      left: 12.h),
                                                  decoration: BoxDecoration(
                                                    color: appTheme.blueGray100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10.h,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 6.h,
                                                  width: 158.h,
                                                  margin: EdgeInsets.only(
                                                      left: 12.h),
                                                  decoration: BoxDecoration(
                                                    color: appTheme.blueGray100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      3.h,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      IntrinsicHeight(
                                        child: Container(
                                          height: 60.h,
                                          width: 326.h,
                                          margin: EdgeInsets.only(bottom: 2.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 52.h,
                                                margin:
                                                    EdgeInsets.only(left: 62.h),
                                                child: Text(
                                                  "lbl_amount".tr,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyles.headlineSmall,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 60.h,
                                                child: Text(
                                                  "lbl_payment".tr,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyles.headlineSmall,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 2.h),
                              SizedBox(
                                width: 42.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20.h,
                                      width: 20.h,
                                      margin: EdgeInsets.only(left: 10.h),
                                      decoration: BoxDecoration(
                                        color: appTheme.blueGray100,
                                        borderRadius: BorderRadius.circular(
                                          10.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      "lbl_review".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyles.headlineSmall,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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
    }
  }
}

/*
class SignInTwoScreen extends StatefulWidget {
  const SignInTwoScreen({Key? key})
      : super(
          key: key,
        );
  @override
  SignInTwoScreenState createState() => SignInTwoScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInTwoProvider(),
      child: SignInTwoScreen(),
    );
  }
}
class SignInTwoScreenState extends State<SignInTwoScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildMainStack(context),
                SizedBox(height: 66.h),
                _buildCancelRow(context),
                SizedBox(height: 318.h),
                _buildNavigationRow(context),
                SizedBox(height: 4.h)
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildRamadanColumn(context),
      ),
    );
  }
  /// Section Widget
  Widget _buildMainStack(BuildContext context) {
    return SizedBox(
      height: 114.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 84.h,
              width: 800.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary,
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black900.withOpacity(0.25),
                    spreadRadius: 2.h,
                    blurRadius: 2.h,
                    offset: Offset(
                      0,
                      4,
                    ),
                  )
                ],
              ),
            ),
          ),
          IntrinsicHeight(            child: Container(
              height: 86.h,
              margin: EdgeInsets.symmetric(horizontal: 60.h),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 86.h,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 24.h,
                              margin: EdgeInsets.only(left: 22.h),
                              decoration: AppDecoration.outlinePrimary.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder12,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 20.h,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(
                                        10.h,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: 68.h,
                              child: Text(
                                "lbl_campaign".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.headlineSmallPrimary,
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                height: 20.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Spacer(),
                                    Container(
                                      height: 6.h,
                                      width: 158.h,
                                      decoration: BoxDecoration(
                                        color: appTheme.blueGray100,
                                        borderRadius: BorderRadius.circular(
                                          3.h,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 20.h,
                                      width: 20.h,
                                      margin: EdgeInsets.only(left: 14.h),
                                      decoration: BoxDecoration(
                                        color: appTheme.blueGray100,
                                        borderRadius: BorderRadius.circular(
                                          10.h,
                                        ),
                                      ),
                                    ),                                    Container(
                                      height: 6.h,
                                      width: 158.h,
                                      margin: EdgeInsets.only(left: 12.h),
                                      decoration: BoxDecoration(
                                        color: appTheme.blueGray100,
                                        borderRadius: BorderRadius.circular(
                                          3.h,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 20.h,
                                      width: 20.h,
                                      margin: EdgeInsets.only(left: 12.h),
                                      decoration: BoxDecoration(
                                        color: appTheme.blueGray100,
                                        borderRadius: BorderRadius.circular(
                                          10.h,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 6.h,
                                      width: 158.h,
                                      margin: EdgeInsets.only(left: 12.h),
                                      decoration: BoxDecoration(
                                        color: appTheme.blueGray100,
                                        borderRadius: BorderRadius.circular(
                                          3.h,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              height: 60.h,
                              width: 326.h,
                              margin: EdgeInsets.only(bottom: 2.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 52.h,
                                    margin: EdgeInsets.only(left: 62.h),
                                    child: Text(
                                      "lbl_amount".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style:
                                          CustomTextStyles.headlineSmallGray600,
                                    ),
                                  ),                                  SizedBox(
                                    width: 60.h,
                                    child: Text(
                                      "lbl_payment".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style:
                                          CustomTextStyles.headlineSmallGray600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 2.h),
                  SizedBox(
                    width: 42.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.h,
                          margin: EdgeInsets.only(left: 10.h),
                          decoration: BoxDecoration(
                            color: appTheme.blueGray100,
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "lbl_review".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.headlineSmallGray600,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  /// Section Widget
  Widget _buildCancelRow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 32.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 58.h,
              child: Text(
                "lbl_cancel".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.headlineLargeOnPrimaryContainer,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 80.h,
              top: 2.h,
            ),
            child: Text(
              "msg_choose_your_cause".tr,
              style: theme.textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }  /// Section Widget
  Widget _buildNavigationRow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 22.h),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
            height: 88.h,
            width: 58.h,
            radius: BorderRadius.circular(
              5.h,
            ),
          ),
          SizedBox(width: 30.h),
          Expanded(
            child: Container(
              height: 402.h,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 396.h,
                      width: 690.h,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          IntrinsicHeight(
                            child: SizedBox(
                              height: 396.h,
                              child: Row(
                                children: [
                                  Container(
                                    height: 396.h,
                                    width: 3958.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 1710.h),
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Container(
                                          height: 396.h,
                                          width: 408.h,
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.onPrimary,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 16.h),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPngtreeRamadan,
                                                  height: 304.h,
                                                  width: 304.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 24.h),
                                                  child: Text(
                                                    "msg_mosque_construction"
                                                        .tr,
                                                    style: CustomTextStyles
                                                        .headlineSmallGray600_1,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgRectangle33,
                                    height: 396.h,
                                    width: 408.h,
                                  )                                ],
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: SizedBox(
                              height: 396.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Spacer(),
                                  Container(
                                    width: 408.h,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 50.h),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: fs.Svg(
                                          ImageConstant.imgRectangle33,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 4.h),
                                        CustomImageView(
                                          imagePath: ImageConstant.imgImages41,
                                          height: 224.h,
                                          width: 224.h,
                                        ),
                                        SizedBox(height: 32.h),
                                        Text(
                                          "lbl_zakat_donation".tr,
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyles
                                              .headlineSmallGray600_1,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 14.h),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: fs.Svg(
                                          ImageConstant.imgRectangle33,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgImage5,
                                          height: 300.h,
                                          width: 92.h,
                                        ),
                                        SizedBox(height: 12.h),
                                        Text(
                                          "msg_dry_scalp_care_shampoo".tr,
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyles
                                              .headlineSmallGray600,
                                        ),
                                        SizedBox(height: 8.h)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 14.h),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: fs.Svg(
                                          ImageConstant.imgRectangle33,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),                                    child: Column(
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgImage6,
                                          height: 300.h,
                                          width: 114.h,
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          "msg_dermacare_scalp".tr,
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyles
                                              .headlineSmallGray600,
                                        ),
                                        SizedBox(height: 10.h)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 14.h),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.h),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: fs.Svg(
                                          ImageConstant.imgRectangle33,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              ImageConstant.imgImage6300x110,
                                          height: 300.h,
                                          width: 110.h,
                                        ),
                                        SizedBox(height: 6.h),
                                        Text(
                                          "msg_care_protect_purify".tr,
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyles
                                              .headlineSmallGray600,
                                        ),
                                        SizedBox(height: 24.h)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 398.h,
                      width: 322.h,
                      margin: EdgeInsets.only(left: 44.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20.h,
                        ),
                        border: Border.all(
                          color: theme.colorScheme.primary,
                          width: 4.h,
                        ),
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgOverflowMenu,
                    height: 88.h,
                    width: 58.h,
                    radius: BorderRadius.circular(
                      5.h,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }  /// Section Widget
  Widget _buildRamadanColumn(BuildContext context) {
    return Container(
      height: 128.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgGroup96,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 14.h),
            padding: EdgeInsets.symmetric(
              horizontal: 36.h,
              vertical: 20.h,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageConstant.imgGroup95,
                ),
                fit: BoxFit.cover,
              ),
            ),
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgPngtreeRamadan,
                  height: 82.h,
                  width: 82.h,
                  margin: EdgeInsets.only(bottom: 6.h),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 242.h,
                    margin: EdgeInsets.only(left: 6.h),
                    child: Text(
                      "msg_mosque_construction_in".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.headlineSmallGray600,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/