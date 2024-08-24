import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AppRoutes {
  static const String splash = '/';

  static Map<String, WidgetBuilder> get routes {
    return {
      splash: SplashScreen.builder,
    };
  }
}
