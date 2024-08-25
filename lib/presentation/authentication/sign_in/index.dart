import 'package:flutter/material.dart';
import '/core/app_export.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => SigninScreenState();
}

class SigninScreenState extends State<SigninScreen> {
  TextEditingController passwordController = TextEditingController();

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
    );
  }

  Widget _buildButton() {
    return CustomElevatedButton(
      name: "lbl_sign_in".tr,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 250.v,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('bg@2'.image.png),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(gutter),
              child: Column(
                children: [
                  _buildInput(
                    hintText: "lbl_password".tr,
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 12.v),
                  _buildInput(
                    hintText: "lbl_password".tr,
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 12.v),
                  _buildButton(),
                  SizedBox(height: 12.v),
                  SizedBox(
                    width: 158.h,
                    child: Text(
                      "lbl_fogot_password".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyles.headlineMedium.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
