import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController unController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildInput({
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
      style: TextStyles.labelMedium.copyWith(
        fontSize: 3.5.fSize,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: TextStyles.labelMedium.copyWith(
        fontSize: 3.5.fSize,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 0.5.v,
        horizontal: 2.0.h,
      ),
    );
  }

  Widget _buildButton() {
    return CustomElevatedButton(
      width: 60.h,
      height: 8.v,
      name: "lbl_sign_in".tr,
      textStyle: TextStyles.displayMedium.copyWith(
        fontSize: 3.5.fSize,
      ),
      onPressed: () {
        NavigatorService.pushNamed(AppRoutes.home);
      },
    );
  }

  Widget get body {
    return Layout(
      child: (orientation) {
        return Column(
          children: [
            SizedBox(
              height: 40.v,
              width: double.maxFinite,
              child: ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  height: 40.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: appTheme.green900,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('stars'.image.png),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "lbl_log_in".tr,
                        style: TextStyles.displayLarge.copyWith(
                          fontSize: 10.fSize,
                          color: appTheme.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60.v,
              width: double.maxFinite,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  children: [
                    SizedBox(height: 4.v),
                    _buildInput(
                      hintText: "lbl_un".tr,
                      controller: unController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 2.v),
                    _buildInput(
                      hintText: "lbl_pw".tr,
                      controller: pwController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 4.v),
                    _buildButton(),
                    SizedBox(height: 2.v),
                    SizedBox(
                      width: 158.h,
                      child: Text(
                        "lbl_fogot_password".tr,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyles.headlineMedium.copyWith(
                          fontSize: 3.5.fSize,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}
