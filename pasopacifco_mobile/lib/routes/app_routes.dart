import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/welcome/splash_screen.dart';
import 'package:pasopacifco_mobile/welcome/welcome_screen.dart';
import 'package:pasopacifco_mobile/authentication/login/login_screen.dart';
import 'package:pasopacifco_mobile/authentication/register/register_screen.dart';
import 'package:pasopacifco_mobile/home/home_screen.dart';
import 'package:pasopacifco_mobile/profile/configuration_screen.dart';
import 'package:pasopacifco_mobile/profile/change_password_screen.dart';
import 'package:pasopacifco_mobile/profile/terms_screen.dart';
import 'package:pasopacifco_mobile/profile/profile_screen.dart';
import 'package:pasopacifco_mobile/sites/site_management_screen.dart';
import 'package:pasopacifco_mobile/sites/add_site_location_screen.dart';
import 'package:pasopacifco_mobile/sites/edit_site_location_screen.dart';
import 'package:pasopacifco_mobile/waste/waste_management_screen.dart';
import 'package:pasopacifco_mobile/waste/add_waste_screen.dart';
import 'package:pasopacifco_mobile/waste/edit_waste_screen.dart';
import 'package:pasopacifco_mobile/reports/report_management_screen.dart';
import 'package:pasopacifco_mobile/reports/foundobject/found_object_screen.dart';
import 'package:pasopacifco_mobile/reports/foundobject/add_found_object_screen.dart';
import 'package:pasopacifco_mobile/reports/fishingvessels/fishing_vessels_screen.dart';
import 'package:pasopacifco_mobile/reports/fishingvessels/add_fishing_vessels_screen.dart';
import 'package:pasopacifco_mobile/reports/packaging/packaging_screen.dart';
import 'package:pasopacifco_mobile/reports/packaging/add_packaging_screen.dart';
import 'package:pasopacifco_mobile/reports/sitedescription/environment_screen.dart';
import 'package:pasopacifco_mobile/reports/sitedescription/site_location_screen.dart';

class AppRoutes {
  static const String siteLocationScreen = '/siteLocationScreen';
  static const String environmentScreen = '/environmentScreen';
  static const String addPackagingScreen = '/addPackagingScreen';
  static const String packagingScreen = '/packagingScreen';
  static const String addFishingVesselsScreen = '/addFishingVesselsScreen';
  static const String fishingVesselsScreen = '/fishingVesselsScreen';
  static const String addFoundObjectScreen = '/addFoundObjectScreen';
  static const String foundObjectScreen = '/foundObjectScreen';
  static const String reportManagementScreen = '/reportManagementScreen';
  static const String ropo = '/editWasteScreen';
  static const String editWasteScreen = '/editWasteScreen';
  static const String addWasteScreen = '/addWasteScreen';
  static const String wasteManagementScreen = '/wasteManagementScreen';
  static const String editSiteLocationScreen = '/editSiteLocationScreen';
  static const String addSiteLocationScreen = '/addSiteLocationScreen';
  static const String siteManagementScreen = '/siteManagementScreen';
  static const String splashScreen = '/splashScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String initialRoute = '/initialRoute';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';
  static const String configurationScreen = '/configurationScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String termsScreen = '/termsScreen';
  static const String profileScreen = '/profileScreen';

  static Map<String, WidgetBuilder> routes = {
    siteLocationScreen: (context) => SiteLocationScreen(),
    environmentScreen: (context) => EnvironmentScreen(),
    addPackagingScreen: (context) => AddPackagingScreen(),
    packagingScreen: (context) => PackagingScreen(),
    addFishingVesselsScreen: (context) => AddFishingVesselsScreen(),
    fishingVesselsScreen: (context) => FishingVesselsScreen(),
    addFoundObjectScreen: (context) => AddFoundObjectScreen(),
    foundObjectScreen: (context) => FoundObjectScreen(),
    reportManagementScreen: (context) => ReportManagementScreen(),
    editWasteScreen: (context) => EditWasteScreen(),
    addWasteScreen: (context) => AddWasteScreen(),
    wasteManagementScreen: (context) => WasteManagementScreen(),
    editSiteLocationScreen: (context) => EditSiteLocationScreen(),
    addSiteLocationScreen: (context) => AddSiteLocationScreen(),
    siteManagementScreen: (context) => SiteManagementScreen(),
    profileScreen: (context) => ProfileScreen(),
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
