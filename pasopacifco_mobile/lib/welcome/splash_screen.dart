import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
//import 'package:pasopacifco_mobile/routes/app_routes.dart';

// Test
//@RoutePage()

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Future<void>.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 28.h),
              CustomImageView(
                imagePath: ImageConstant.Logo,
                height: 312.h,
                width: 312.h,
                radius: BorderRadius.circular(
                  16.h,
                ),
              ),
              _buildColumn(context),
            ],
          ),
        ),
      ),
    );
  }
}

/// Section Widget
Widget _buildColumn(BuildContext context) {
  return Container(
    width: double.maxFinite,
    margin: EdgeInsets.only(
      left: 12.h,
      right: 8.h,
    ),
    child: Column(
      children: [
        GestureDetector(
          onTap: () => onTapImgImageone(context),
          child: CustomImageView(
            imagePath: ImageConstant.logo_welcome,
            height: 100.h,
            width: 202.h,
          ),
        )
      ],
    ),
  );
}

/// Navigates to the bienvenidoOneScreen when the action is triggered.
onTapImgImageone(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.welcomeScreen);
}
