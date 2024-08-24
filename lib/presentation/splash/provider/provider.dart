import 'package:flutter/material.dart';
import '../models/model.dart';

class SplashProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SplashModel splashModelObj = SplashModel();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
