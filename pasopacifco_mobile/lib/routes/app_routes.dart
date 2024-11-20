import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/welcome/splash_screen.dart';
import 'package:pasopacifco_mobile/welcome/welcome_screen.dart';
import 'package:pasopacifco_mobile/authentication/login/login_screen.dart';
import 'package:pasopacifco_mobile/authentication/register/register_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String initialRoute = '/initialRoute';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    splashScreen: (context) => SplashScreen(),
    welcomeScreen: (context) => WelcomeScreen(),
    initialRoute: (context) => SplashScreen(),
  };
}
