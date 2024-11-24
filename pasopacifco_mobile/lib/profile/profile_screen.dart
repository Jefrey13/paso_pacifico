import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  TextEditingController lockoneController = TextEditingController();
  TextEditingController emailoneController = TextEditingController();
  TextEditingController phonesphonecallController = TextEditingController();
  TextEditingController grouponeController = TextEditingController();
  TextEditingController lucidesquarepenController = TextEditingController();
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
                  left: 20.h,
                  right: 24.h,
                  top: 20.h,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 90.h,
                      width: 92.h,
                      decoration: BoxDecoration(
                        color: appTheme.gray900.withOpacity(0.12),
                        borderRadius: BorderRadiusStyle.roundedBorder44,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.image_not_found,
                            height: 90.h,
                            width: 90.h,
                            radius: BorderRadius.circular(
                              44.h,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "MarlonAguilar",
                      style: CustomTextStyles.titleSmallOnPrimary,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Cordinador",
                      style: CustomTextStyles.bodyMediumGray60001_1,
                    ),
                    SizedBox(height: 30.h),
                    _buildNameField(context),
                    SizedBox(height: 20.h),
                    _buildEmailField(context),
                    SizedBox(height: 20.h),
                    _buildNumberField(context),
                    SizedBox(height: 20.h),
                    _buildDateOfBirthField(context),
                    SizedBox(height: 22.h),
                    Text(
                      "Se unió el 17 de octubre de 2024",
                      style: CustomTextStyles.bodySmallRobotoGray60001,
                    ),
                    SizedBox(height: 142.h)
                  ],
                ),
              ),
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
      centerTitle: true,
      title: AppbarTitle(
        text: "Mi perfil",
      ),
    );
  }

  Widget _buildNameField(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nombre Completo",
            style: CustomTextStyles.bodyMediumGray60001,
          ),
          SizedBox(
            height: 6.h,
          ),
          CustomTextFormField(
            controller: lockoneController,
            hintText: "Marlon Aguilar",
            hintStyle: CustomTextStyles.bodyMediumOnPrimary,
            prefix: Container(
              margin: EdgeInsets.only(
                top: 6.h,
                right: 16.h,
                bottom: 6.h,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.profile,
                height: 20.h,
                width: 22.h,
                fit: BoxFit.contain,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 34.h,
            ),
            suffix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 6.h, 20.h, 6.h),
              child: CustomImageView(
                imagePath: ImageConstant.pen,
                height: 20.h,
                width: 22.h,
                fit: BoxFit.contain,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 34.h,
            ),
            contentPadding: EdgeInsets.only(
              left: 6.h,
              top: 20.h,
              bottom: 6.h,
            ),
            borderDecoration: TextFormFieldStyleHelper.underLineGray,
            filled: false,
          )
        ],
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Correo electrónico",
            style: CustomTextStyles.bodyMediumGray60001,
          ),
          SizedBox(
            height: 6.h,
          ),
          CustomTextFormField(
            controller: lockoneController,
            hintText: "marlonaguiar@gmail.com",
            hintStyle: CustomTextStyles.bodyMediumOnPrimary,
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
              maxHeight: 34.h,
            ),
            suffix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 6.h, 20.h, 6.h),
              child: CustomImageView(
                imagePath: ImageConstant.pen,
                height: 20.h,
                width: 22.h,
                fit: BoxFit.contain,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 34.h,
            ),
            contentPadding: EdgeInsets.only(
              left: 6.h,
              top: 20.h,
              bottom: 6.h,
            ),
            borderDecoration: TextFormFieldStyleHelper.underLineGray,
            filled: false,
          )
        ],
      ),
    );
  }

  Widget _buildNumberField(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Número de teléfono",
            style: CustomTextStyles.bodyMediumGray60001_1,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            controller: phonesphonecallController,
            hintText: "+506 8888 8888",
            hintStyle: CustomTextStyles.bodyMediumOnPrimary,
            textInputType: TextInputType.phone,
            prefix: Container(
              margin: EdgeInsets.only(
                top: 6.h,
                right: 16.h,
                bottom: 6.h,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.pen,
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
                imagePath: ImageConstant.pen,
                height: 20.h,
                width: 22.h,
                fit: BoxFit.contain,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 32.h,
            ),
            contentPadding: EdgeInsets.only(
              left: 6.h,
              top: 20.h,
              bottom: 6.h,
            ),
            borderDecoration: TextFormFieldStyleHelper.underLineGray,
            filled: false,
          ),
        ],
      ),
    );
  }

  Widget _buildDateOfBirthField(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fecha de nacimiento",
            style: CustomTextStyles.bodyMediumGray60001,
          ),
          SizedBox(
            height: 6.h,
          ),
          CustomTextFormField(
            controller: lockoneController,
            hintText: "15 de octubre de 2024",
            hintStyle: CustomTextStyles.bodyMediumOnPrimary,
            prefix: Container(
              margin: EdgeInsets.only(
                top: 6.h,
                right: 16.h,
                bottom: 6.h,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.confetti,
                height: 20.h,
                width: 22.h,
                fit: BoxFit.contain,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 34.h,
            ),
            suffix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 6.h, 20.h, 6.h),
              child: CustomImageView(
                imagePath: ImageConstant.pen,
                height: 20.h,
                width: 22.h,
                fit: BoxFit.contain,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 34.h,
            ),
            contentPadding: EdgeInsets.only(
              left: 6.h,
              top: 20.h,
              bottom: 6.h,
            ),
            borderDecoration: TextFormFieldStyleHelper.underLineGray,
            filled: false,
          )
        ],
      ),
    );
  }
}
