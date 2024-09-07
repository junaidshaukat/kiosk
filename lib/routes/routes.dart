import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String media = '/media';
  static const String signin = '/signin';
  static const String forgotPassword = '/forgot_password';
  static const String resetPassword = '/reset_password';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomeScreen(),
media: (context) => const MediaScreen(),
splash: (context) => const SplashScreen(),
signin: (context) => const SigninScreen(),
resetPassword: (context) => const ResetPasswordScreen(),
forgotPassword: (context) => const ForgotPasswordScreen(),
    };
  }
}
