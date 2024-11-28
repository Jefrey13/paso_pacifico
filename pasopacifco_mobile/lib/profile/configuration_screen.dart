import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';

class ConfigurationScreen extends StatelessWidget {
  ConfigurationScreen({Key? key}) : super(key: key);

  TextEditingController privacypolicyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 20.h,
            right: 16.h,
            top: 20.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "General",
                style: CustomTextStyles.titleSmallGray60001,
              ),
              SizedBox(height: 12.h),
              _buildColumnchangepas(context),
              SizedBox(height: 10.h),
              Text(
                "Seguridad",
                style: CustomTextStyles.titleSmallGray60001,
              ),
              SizedBox(height: 6.h),
              _buildColumnchangepas1(context),
              SizedBox(height: 10.h),
              _buildColumnprivacypo(context),
              SizedBox(height: 10.h),
              _buildColumnSignUp(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 62.h,
      leading: AppbarLeadingIconButton(
        imagePath: ImageConstant.arrowBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 7.h,
          bottom: 7.h,
        ),
        onTap: () {},
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Configuración",
      ),
    );
  }

  Widget _buildColumnchangepas(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () => onTapProfile(context),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: _buildRowchangepasswo(
                  context,
                  changepassword: "Mi perfil",
                ),
              ),
              //SizedBox(height: 10.h),
              CustomTextFormField(
                contentPadding: EdgeInsets.fromLTRB(1.h, 1.h, 1.h, 1.h),
                borderDecoration: TextFormFieldStyleHelper.underLineGray,
                filled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumnchangepas1(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () => onTapChangePassword(context),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: _buildRowchangepasswo(
                context,
                changepassword: "Cambiar contraseña",
              ),
            ),
            //SizedBox(height: 10.h),
            CustomTextFormField(
              contentPadding: EdgeInsets.fromLTRB(1.h, 1.h, 1.h, 1.h),
              borderDecoration: TextFormFieldStyleHelper.underLineGray,
              filled: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumnprivacypo(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () => onTapTermsAndConditions(context),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: _buildRowchangepasswo(
                  context,
                  changepassword: "Política de privacidad",
                ),
              ),
              //SizedBox(height: 8.h),
              CustomTextFormField(
                contentPadding: EdgeInsets.fromLTRB(1.h, 1.h, 1.h, 1.h),
                borderDecoration: TextFormFieldStyleHelper.underLineGray,
                filled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumnSignUp(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () async => await onTapSignUp(context),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: _buildRowchangepasswo(
                  context,
                  changepassword: "Cerrar Sesión",
                ),
              ),
              //SizedBox(height: 8.h),
              CustomTextFormField(
                contentPadding: EdgeInsets.fromLTRB(1.h, 1.h, 1.h, 1.h),
                borderDecoration: TextFormFieldStyleHelper.underLineGray,
                filled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowchangepasswo(
    BuildContext context, {
    required String changepassword,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            changepassword,
            style: CustomTextStyles.bodyMediumOnPrimary.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.arrow,
          height: 24.h,
          width: 26.h,
        )
      ],
    );
  }

  onTapChangePassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
  }

  onTapTermsAndConditions(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.termsScreen);
  }

  Future<void> onTapSignUp(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(
      msg: "¡Sesión cerrada exitosamente!",
      backgroundColor: Colors.green,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      fontSize: 16.0,
      toastLength: Toast.LENGTH_SHORT,
    );
    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
  }

  onTapProfile(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileScreen);
  }
}
