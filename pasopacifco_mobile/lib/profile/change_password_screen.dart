import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:pasopacifco_mobile/profile/services/change_password_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordoneController = TextEditingController();
  TextEditingController passwordtwoController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              right: 16.h,
              top: 8.h,
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
      title: AppbarTitle(
        text: "Cambiar contraseña",
        margin: EdgeInsets.only(
          right: 84.h,
        ),
      ),
    );
  }

  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "********************",
      hintStyle: CustomTextStyles.bodyMediumErrorContainer,
      textInputType: TextInputType.visiblePassword,
      suffix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 14.h, 12.h, 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.eye,
          height: 18.h,
          width: 16.h,
          fit: BoxFit.contain,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 50.h,
      ),
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 14.h,
      ),
    );
  }

  Widget _buildPasswordone(BuildContext context) {
    return CustomTextFormField(
      controller: passwordoneController,
      hintText: "********************",
      hintStyle: CustomTextStyles.bodyMediumErrorContainer,
      textInputType: TextInputType.visiblePassword,
      suffix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 14.h, 12.h, 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.eye,
          height: 18.h,
          width: 16.h,
          fit: BoxFit.contain,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 50.h,
      ),
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 14.h,
      ),
    );
  }

  Widget _buildPasswordtwo(BuildContext context) {
    return CustomTextFormField(
      controller: passwordtwoController,
      hintText: "********************",
      hintStyle: CustomTextStyles.bodyMediumErrorContainer,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      suffix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 14.h, 12.h, 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.eye,
          height: 18.h,
          width: 16.h,
          fit: BoxFit.contain,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 50.h,
      ),
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 14.h,
      ),
    );
  }

  Widget _buildCambiar(BuildContext context) {
    return CustomElevatedButton(
      text: "Cambiar Contraseña",
      onPressed: () => _changePassword(context),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contraseña actual",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 4.h),
                _buildPassword(context),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nueva contraseña",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 4.h),
                _buildPasswordone(context),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirmar nueva contraseña",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 4.h),
                _buildPasswordtwo(context),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          _buildCambiar(context),
        ],
      ),
    );
  }

  Future<void> _changePassword(BuildContext context) async {
    // Verifica si el formulario es válido
    if (!_formKey.currentState!.validate()) {
      Fluttertoast.showToast(
        msg: "Por favor llena todos los campos correctamente.",
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    }
    // Captura los valores de las contraseñas

    final currentPassword = passwordController.text;
    final newPassword = passwordoneController.text;
    final confirmPassword = passwordtwoController.text;

    // Valida que la nueva contraseña y su confirmación coincidan
    if (newPassword != confirmPassword) {
      Fluttertoast.showToast(
        msg: "Las nuevas contraseñas no coinciden.",
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    }

    // Llama al servicio de cambio de contraseña
    final changePasswordService = ChangePasswordService();

    try {
      await changePasswordService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      // Muestra un mensaje de éxito
      Fluttertoast.showToast(
        msg: "Contraseña actualizada exitosamente.",
        backgroundColor: Colors.green,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0,
        toastLength: Toast.LENGTH_SHORT,
      );

      Navigator.pop(context);
    } catch (e) {
      // Manejo de errores
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
}
