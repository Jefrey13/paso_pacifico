import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/welcome/splash_screen.dart';
import 'package:pasopacifco_mobile/welcome/welcome_screen.dart';
import 'package:pasopacifco_mobile/authentication/login/login_screen.dart';
import 'package:pasopacifco_mobile/authentication/register/register_screen.dart';
import 'package:pasopacifco_mobile/home/home_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String initialRoute = '/initialRoute';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';

  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => HomeScreen(),
    registerScreen: (context) => RegisterScreen(),
    loginScreen: (context) => LoginScreen(),
    welcomeScreen: (context) => WelcomeScreen(),
    splashScreen: (context) => SplashScreen(),
    initialRoute: (context) => SplashScreen(),
  };
}
