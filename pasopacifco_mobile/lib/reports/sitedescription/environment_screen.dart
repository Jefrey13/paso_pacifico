import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_checkbox_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_drop_dowm.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:path/path.dart';

class EnvironmentScreen extends StatelessWidget {
  EnvironmentScreen({Key? key}) : super(key: key);

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];
  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 8.h,
            right: 40.h,
            top: 8.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildColumndetallesd(context)],
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
        text: "Descripción del sitio",
      ),
    );
  }

  Widget _buildColumndetallesd(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detalles del sitio",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: CustomDropDown(
              icon: Container(
                margin: EdgeInsets.only(left: 16.h),
                child: CustomImageView(
                  imagePath: ImageConstant.arrowdown,
                  width: 18.h,
                  height: 24.h,
                  fit: BoxFit.contain,
                ),
              ),
              iconSize: 18.h,
              hintText: "Tipo de entorno (escoge uno)",
              items: dropdownItemList,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 14.h,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: CustomDropDown(
              icon: Container(
                margin: EdgeInsets.only(left: 28.h),
                child: CustomImageView(
                  imagePath: ImageConstant.arrowdown,
                  width: 18.h,
                  height: 24.h,
                  fit: BoxFit.contain,
                ),
              ),
              iconSize: 24.h,
              hintText: "Modalidad de registro de datos (escoge uno)",
              items: dropdownItemList1,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.h),
            ),
          ),
          SizedBox(height: 24.h),
          CustomElevatedButton(
            text: "Continuar Registro",
            margin: EdgeInsets.only(right: 4.h),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.siteLocationScreen);
            },
          )
        ],
      ),
    );
  }
}
