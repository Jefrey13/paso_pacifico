import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/authentication/login/services/login_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 8.h,
              top: 4.h,
              right: 8.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [_buildContainer(context)],
            ),
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
              "Correo Electrónico",
              style: CustomTextStyles.bodyMediumGray60001_1,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(right: 6.h),
            child: CustomTextFormField(
              controller: emailController,
              hintText: "Correo Electrónico",
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El correo electrónico es obligatorio.';
                }
                final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                if (!emailRegex.hasMatch(value)) {
                  return 'Por favor, introduce un correo válido.';
                }
                return null;
              },
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
              controller: passwordController,
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
              obscureText: true,
              contentPadding: EdgeInsets.only(
                top: 6.h,
                right: 20.h,
                bottom: 6.h,
              ),
              borderDecoration: TextFormFieldStyleHelper.underLineGray,
              filled: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La contraseña es obligatoria.';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 22.h),
          CustomElevatedButton(
            text: "Iniciar Sesion",
            margin: EdgeInsets.only(right: 2.h),
            buttonTextStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
            onPressed: () => _loginUser(context),
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

  Future<void> _loginUser(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      Fluttertoast.showToast(
        msg: "Por favor, llena todos los campos correctamente.",
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    }

    try {
      final loginService = LoginService();

      final user = await loginService.loginUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (user != null) {
        Fluttertoast.showToast(
          msg: "Inicio de sesión exitoso. Bienvenido, ${user.email}!",
          backgroundColor: Colors.green,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          fontSize: 16.0,
          toastLength: Toast.LENGTH_SHORT,
        );
        Navigator.pushNamed(context, AppRoutes.homeScreen);
      }
    } catch (e) {
      String errorMessage = e.toString().replaceFirst('Exception: ', '');
      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      height: 50.h,
      leadingWidth: 50.h,
      leading: AppbarLeadingIconButton(
        imagePath: ImageConstant.arrowBack,
        margin: EdgeInsets.only(
          left: 17.h,
          top: 2.h,
          bottom: 6.h,
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }

  onTapTxtAnnotienescuenta(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }
}
