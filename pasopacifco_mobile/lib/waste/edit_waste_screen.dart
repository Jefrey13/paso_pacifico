//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/theme/custom_button_style.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_checkbox_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_drop_dowm.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_search_view.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:path/path.dart';

class EditWasteScreen extends StatelessWidget {
  EditWasteScreen({Key? key}) : super(key: key);

  TextEditingController inputinneroneController = TextEditingController();
  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];
  TextEditingController facebookoneController = TextEditingController();

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
            top: 18.h,
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
                  children: [
                    _buildInput(context),
                    SizedBox(height: 12.h),
                    CustomDropDown(
                      icon: Container(
                        margin: EdgeInsets.only(left: 16.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.arrowdown,
                          width: 18.h,
                          height: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      iconSize: 18.h,
                      hintText: "Otros residuos",
                      items: dropdownItemList,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.h,
                        vertical: 14.h,
                      ),
                      borderDecoration: DropDownStyleHelper.outlineGrayTL4,
                      fillColor: theme.colorScheme.onPrimaryContainer,
                    ),
                    SizedBox(height: 12.h),
                    _buildColumnlabel(context),
                    SizedBox(height: 24.h),
                    _buildRoweditar(context),
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
        text: "Detalle Residuo",
        margin: EdgeInsets.only(right: 96.h),
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nombre",
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 4.h),
          CustomTextFormField(
            controller: inputinneroneController,
            hintText: "Puntas de puros",
            hintStyle: theme.textTheme.bodyMedium!,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 14.h,
            ),
          )
        ],
      ),
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
            "Descripcion",
            style: CustomTextStyles.bodyLargeBlack900,
          ),
          SizedBox(height: 4.h),
          CustomTextFormField(
            controller: facebookoneController,
            hintText: "Puntas de puros",
            hintStyle: CustomTextStyles.bodyMediumErrorContainer,
            textInputAction: TextInputAction.done,
            suffix: Container(
              margin: EdgeInsets.fromLTRB(12.h, 4.h, 2.h, 4.h),
              child: CustomImageView(
                imagePath: ImageConstant.resize,
                height: 8.h,
                width: 8.h,
                fit: BoxFit.contain,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 150.h,
            ),
            maxLines: 7,
            contentPadding: EdgeInsets.fromLTRB(8.h, 4.h, 2.h, 4.h),
          ),
        ],
      ),
    );
  }

  Widget _buildActualizar(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 56.h,
        text: "Actualizar",
        buttonStyle: CustomButtonStyles.fillPrimaryTL16,
        buttonTextStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
      ),
    );
  }

  Widget _buildDesactivar(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 56.h,
        text: "Desactivar",
        margin: EdgeInsets.only(left: 10.h),
        buttonStyle: CustomButtonStyles.fillRedTL4,
        buttonTextStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
        onPressed: () {},
      ),
    );
  }

  Widget _buildRoweditar(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            _buildActualizar(context),
            SizedBox(width: 24.h),
            _buildDesactivar(context)
          ],
        ),
      ),
    );
  }
}
