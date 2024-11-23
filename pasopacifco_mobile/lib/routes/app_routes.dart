import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/welcome/splash_screen.dart';
import 'package:pasopacifco_mobile/welcome/welcome_screen.dart';
import 'package:pasopacifco_mobile/authentication/login/login_screen.dart';
import 'package:pasopacifco_mobile/authentication/register/register_screen.dart';
import 'package:pasopacifco_mobile/home/home_screen.dart';
import 'package:pasopacifco_mobile/profile/configuration_screen.dart';
import 'package:pasopacifco_mobile/profile/change_password_screen.dart';
import 'package:pasopacifco_mobile/profile/terms_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String initialRoute = '/initialRoute';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';
  static const String configurationScreen = '/configurationScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String termsScreen = '/termsScreen';

  static Map<String, WidgetBuilder> routes = {
    termsScreen: (context) => TermsScreen(),
    changePasswordScreen: (context) => ChangePasswordScreen(),
    configurationScreen: (context) => ConfigurationScreen(),
    homeScreen: (context) => HomeScreen(),
    registerScreen: (context) => RegisterScreen(),
    loginScreen: (context) => LoginScreen(),
    welcomeScreen: (context) => WelcomeScreen(),
    splashScreen: (context) => SplashScreen(),
    initialRoute: (context) => SplashScreen(),
  };
}
