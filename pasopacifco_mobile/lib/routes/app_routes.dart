import 'package:flutter/material.dart';

import 'package:pasopacifco_mobile/welcome/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String initialRoute = '/initialRoute';
  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    initialRoute: (context) => const SplashScreen(),
  };
}
