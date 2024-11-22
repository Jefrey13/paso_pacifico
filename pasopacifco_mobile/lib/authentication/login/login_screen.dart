import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController searchoneController = TextEditingController();
  final TextEditingController interfaceessentController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 8.h,
            top: 88.h,
            right: 8.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildContainer(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Iniciar sesión",
              style: theme.textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 24.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Nombre Usuario",
              style: CustomTextStyles.bodyMediumGray60001_1,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(right: 6.h),
            child: CustomTextFormField(
              controller: searchoneController,
              hintText: "Nombre de Usuario",
              hintStyle: CustomTextStyles.bodyMediumOnPrimary,
              prefix: Container(
                margin: EdgeInsets.only(
                  top: 6.h,
                  right: 16.h,
                  bottom: 6.h,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.userlogin,
                  height: 20.h,
                  width: 20.h,
                  fit: BoxFit.contain,
                ),
              ),
              prefixConstraints: BoxConstraints(
                maxHeight: 32.h,
              ),
              contentPadding: EdgeInsets.only(
                top: 6.h,
                right: 20.h,
                bottom: 6.h,
              ),
              borderDecoration: TextFormFieldStyleHelper.underLineGray,
              filled: false,
            ),
          ),
          SizedBox(height: 10.h),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Contraseña",
                style: CustomTextStyles.bodyMediumGray60001_1,
              )),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(right: 6.h),
            child: CustomTextFormField(
              controller: interfaceessentController,
              hintText: "Contraseña",
              hintStyle: CustomTextStyles.bodyMediumOnPrimary,
              textInputAction: TextInputAction.done,
              prefix: Container(
                margin: EdgeInsets.only(
                  top: 6.h,
                  right: 16.h,
                  bottom: 6.h,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.password,
                  height: 20.h,
                  width: 22.h,
                  fit: BoxFit.contain,
                ),
              ),
              prefixConstraints: BoxConstraints(
                maxHeight: 32.h,
              ),
              suffix: Container(
                margin: EdgeInsets.fromLTRB(16.h, 6.h, 20.h, 6.h),
                child: CustomImageView(
                  imagePath: ImageConstant.eye,
                  height: 20.h,
                  width: 22.h,
                  fit: BoxFit.contain,
                ),
              ),
              suffixConstraints: BoxConstraints(
                maxHeight: 32.h,
              ),
              obscureText: true,
              contentPadding: EdgeInsets.only(
                top: 6.h,
                right: 20.h,
                bottom: 6.h,
              ),
              borderDecoration: TextFormFieldStyleHelper.underLineGray,
              filled: false,
            ),
          ),
          SizedBox(height: 22.h),
          CustomElevatedButton(
            text: "Iniciar Sesion",
            margin: EdgeInsets.only(right: 2.h),
            buttonTextStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.homeScreen);
            },
          ),
          SizedBox(height: 24.h),
          GestureDetector(
              onTap: () => onTapTxtAnnotienescuenta(context),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "¿Aún no tienes cuenta?.",
                      style: CustomTextStyles.bodyMediumGray60001,
                    ),
                    TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: "Crear Cuenta",
                      style: CustomTextStyles.bodyMediumPrimary,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  /// Navigates to the homeScreen when the action is triggered.
  //onTapInciarsesion(BuildContext context) {
  //Navigator.pushNamed(context, AppRoutes.homeScreen);
  //}

  /// Navigates to the crearCuentaScreen when the action is triggered.
  onTapTxtAnnotienescuenta(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }
}
