import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/reports/widgets/management_report_element_widget.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/sites/widgets/management_elements_widget.dart';
import 'package:pasopacifco_mobile/theme/custom_button_style.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_checkbox_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_drop_dowm.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:path/path.dart';

class AddPackagingScreen extends StatelessWidget {
  AddPackagingScreen({Key? key}) : super(key: key);

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];
  TextEditingController inputinneroneController = TextEditingController();
  TextEditingController inputinnerController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 8.h,
            top: 16.h,
            right: 8.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 2.h),
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Seleccionar residuo",
                      style: CustomTextStyles.bodyLargeBlack900001,
                    ),
                    CustomDropDown(
                      icon: Container(
                        margin: EdgeInsets.only(left: 16.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.arrowdown,
                          height: 18.h,
                          width: 18.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      iconSize: 18.h,
                      hintText: "Seleccionar residuo",
                      hintStyle: theme.textTheme.bodyMedium!,
                      items: dropdownItemList,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.h,
                        vertical: 14.h,
                      ),
                      borderDecoration: DropDownStyleHelper.outlineGrayTL4,
                      fillColor: theme.colorScheme.onPrimaryContainer,
                    ),
                    SizedBox(height: 12.h),
                    _buildHorizontal(context),
                    SizedBox(height: 12.h),
                    _buildColumnlabel(context),
                    SizedBox(height: 22.h),
                    _buildAgregarresiduo(context)
                  ],
                ),
              ),
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
        text: "Agregar Residuo",
      ),
    );
  }

  Widget _buildInputinnerone(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.h),
      child: CustomTextFormField(
        controller: inputinneroneController,
        hintText: "33",
        hintStyle: theme.textTheme.bodyMedium!,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 14.h,
        ),
      ),
    );
  }

  Widget _buildInputinner(BuildContext context) {
    return CustomTextFormField(
      controller: inputinnerController,
      hintText: "Higiene personal",
      hintStyle: CustomTextStyles.bodyMediumOnPrimary,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.h,
      ),
    );
  }

  Widget _buildHorizontal(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          SizedBox(
            width: 96.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: CustomTextStyles.bodyMediumBlack900,
                ),
                SizedBox(height: 4.h),
                _buildInputinnerone(context)
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categoria",
                  style: CustomTextStyles.bodyLargeBlack900,
                ),
                SizedBox(height: 4.h),
                _buildInputinner(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return CustomTextFormField(
      controller: descriptionController,
      hintText:
          "Los envases de helados son recipientes, usualmente de cartón o plástico.",
      hintStyle: theme.textTheme.bodyMedium!,
      textInputAction: TextInputAction.done,
      suffix: Container(
        margin: EdgeInsets.fromLTRB(12.h, 4.h, 2.h, 4.h),
        child: CustomImageView(
          imagePath: ImageConstant.resize,
          width: 8.h,
          height: 8.h,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 150.h,
      ),
      maxLines: 7,
      contentPadding: EdgeInsets.fromLTRB(8.h, 4.h, 2.h, 4.h),
    );
  }

  Widget _buildColumnlabel(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Descripción",
            style: CustomTextStyles.bodyLargeBlack900,
          ),
          SizedBox(height: 4.h),
          _buildDescription(context)
        ],
      ),
    );
  }

  Widget _buildAgregarresiduo(BuildContext context) {
    return CustomElevatedButton(
      height: 52.h,
      text: "Agregar Residuo",
      onPressed: () {},
    );
  }
}
