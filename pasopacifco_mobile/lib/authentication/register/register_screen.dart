//import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/authentication/register/services/register_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController emailsemailmailController = TextEditingController();
  TextEditingController searchoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController calloneController = TextEditingController();
  TextEditingController interfaceessentController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 8.h,
                  top: 4.h,
                  right: 8.h,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(horizontal: 4.h),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Crear Cuenta",
                              style: theme.textTheme.headlineMedium,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Nombre completo",
                              style: CustomTextStyles.bodyMediumGray60001_1,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          _buildEmailsemailmail(context),
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Nombre Usuario",
                              style: CustomTextStyles.bodyMediumGray60001_1,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          _buildSearchone(context),
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Correo electrónico",
                              style: CustomTextStyles.bodyMediumGray60001_1,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          _buildEmail(context),
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Número telefónico",
                              style: CustomTextStyles.bodyMediumGray60001_1,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          _buildCallone(context),
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Contraseña",
                              style: CustomTextStyles.bodyMediumGray60001_1,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          _buildInterfaceessent(context),
                          SizedBox(height: 22.h),
                          _buildCrearcuenta(context),
                          SizedBox(height: 24.h),
                          GestureDetector(
                            onTap: () => onTapTxtEresusuarioregistrado(context),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "¿Eres usuario registrado?.",
                                    style:
                                        CustomTextStyles.bodyMediumGray60001_1,
                                  ),
                                  TextSpan(
                                    text: "",
                                  ),
                                  TextSpan(
                                    text: "Iniciar sesión",
                                    style: CustomTextStyles.bodyMediumPrimary,
                                  )
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 56.h)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailsemailmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: CustomTextFormField(
        controller: emailsemailmailController,
        hintText: "Nombre completo",
        hintStyle: CustomTextStyles.bodyMediumOnPrimary,
        prefix: Container(
          margin: EdgeInsets.only(
            top: 6.h,
            right: 16.h,
            bottom: 6.h,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.person,
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
            return 'El nombre completo es obligatorio.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSearchone(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
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
            height: 20,
            width: 20,
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
            return 'El nombre de usuario es obligatorio.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: CustomTextFormField(
        controller: emailController,
        hintText: "direcciondecorreo@gmail.com",
        hintStyle: CustomTextStyles.bodyMediumOnPrimary,
        textInputType: TextInputType.emailAddress,
        prefix: Container(
          margin: EdgeInsets.only(
            top: 6.h,
            right: 16.h,
            bottom: 6.h,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.email,
            height: 20.h,
            width: 22.h,
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
            return 'Por favor, introduce un correo electrónico válido.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildCallone(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: CustomTextFormField(
        controller: calloneController,
        hintText: "+505-81924567",
        hintStyle: CustomTextStyles.bodyMediumOnPrimary,
        prefix: Container(
          margin: EdgeInsets.only(
            top: 6.h,
            right: 16.h,
            bottom: 6.h,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.phone,
            height: 20.h,
            width: 22.h,
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
            return 'El número telefónico es obligatorio.';
          }
          final phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');
          if (!phoneRegex.hasMatch(value)) {
            return 'Introduce un número telefónico válido.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildInterfaceessent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: CustomTextFormField(
        controller: interfaceessentController,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'La contraseña es obligatoria.';
          }
          if (value.length < 6) {
            return 'La contraseña debe tener al menos 6 caracteres.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildCrearcuenta(BuildContext context) {
    return CustomElevatedButton(
      text: "Crear Cuenta",
      margin: EdgeInsets.only(right: 4.h),
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
      onPressed: () => _registerUser(context),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      height: 50.h,
      //leadingWidth: 59.h,
      leadingWidth: 50.h,
      leading: AppbarLeadingIconButton(
        imagePath: ImageConstant.arrowBack,
        margin: EdgeInsets.only(
          left: 17.h,
          top: 2.h,
          bottom: 6.h,
        ),
        onTap: () {},
      ),
    );
  }

  /// Navigates to the Login when the action is triggered.
  // onTapCrearcuenta(BuildContext context) {
  //   Navigator.pop(context);
  // }

  /// Navigates to the LoginScreen when the action is triggered.
  onTapTxtEresusuarioregistrado(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> _registerUser(BuildContext context) async {
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
      void validateInputs({
        required String email,
        required String password,
        required String displayName,
        required String username,
        required String phoneNumber,
      }) {
        if (email.isEmpty)
          throw Exception("El correo electrónico es obligatorio.");
        if (password.isEmpty) throw Exception("La contraseña es obligatoria.");
        if (password.length < 6)
          throw Exception("La contraseña debe tener al menos 6 caracteres.");
        if (displayName.isEmpty)
          throw Exception("El nombre completo es obligatorio.");
        if (username.isEmpty)
          throw Exception("El nombre de usuario es obligatorio.");
        if (phoneNumber.isEmpty)
          throw Exception("El número telefónico es obligatorio.");
      }

      // Validación adicional
      validateInputs(
        email: emailController.text.trim(),
        password: interfaceessentController.text.trim(),
        displayName: emailsemailmailController.text.trim(),
        username: searchoneController.text.trim(),
        phoneNumber: calloneController.text.trim(),
      );

      final registerService = RegisterService();

      final user = await registerService.registerUser(
        email: emailController.text.trim(),
        password: interfaceessentController.text.trim(),
        displayName: emailsemailmailController.text.trim(),
        username: searchoneController.text.trim(),
        phoneNumber: calloneController.text.trim(),
      );

      if (user != null) {
        Fluttertoast.showToast(
          msg: "Usuario completado con éxito!",
          backgroundColor: Colors.green,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          fontSize: 16.0,
          toastLength: Toast.LENGTH_SHORT,
        );
        Navigator.pop(context);
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
}
