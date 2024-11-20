import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 8.h,
            top: 66.h,
            right: 8.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 2.h),
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Column(
                  children: [
                    Image.asset(
                      ImageConstant.logo_welcome1,
                      height: 212.h,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        "Protección de Hábitas Locales",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium!.copyWith(
                          height: 1.29,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        "Empoderamos a la población local para conservar sus ecosistemas.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.titleSmallGray60001SemiBold
                            .copyWith(
                          height: 1.43,
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    CustomElevatedButton(
                      text: "Continuar ",
                      margin: EdgeInsets.only(right: 6.h),
                      onPressed: () => onTapContinuar(context),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapContinuar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
