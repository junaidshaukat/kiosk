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

  Widget _buildInput() {
    return const Input();
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
            Expanded(
              child: Container(
                height: 250.v,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('bg@2'.image.png),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.adaptSize),
              child: Column(
                children: [
                  _buildInput(),
                  _buildInput(),
                  _buildButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
