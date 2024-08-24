import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AppRoutes {
  static const String splash = '/';
  static const String signin = '/signin';
  static const String dashboard = '/dashboard';
  static const String fogotPassword = '/fogot_password';
  static const String resetPassword = '/reset_password';

  static Map<String, WidgetBuilder> get routes {
    return {
      splash: (context) => const SplashScreen(),
      signin: (context) => const SigninScreen(),
    };
  }
}
