import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AppRoutes {
  static const String splash = '/';
  static const String flow = '/flow';
  static const String home = '/home';
  static const String signin = '/signin';
  static const String fogotPassword = '/fogot_password';
  static const String resetPassword = '/reset_password';

  static Map<String, WidgetBuilder> get routes {
    return {
      flow: (context) => const FlowScreen(),
      home: (context) => const HomeScreen(),
      splash: (context) => const SplashScreen(),
      signin: (context) => const SigninScreen(),
    };
  }
}
