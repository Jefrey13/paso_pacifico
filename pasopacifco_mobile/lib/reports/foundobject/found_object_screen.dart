import 'dart:collection';

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

class FoundObjectScreen extends StatelessWidget {
  FoundObjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  children: [
                    _buildButtontwo(context),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          _buildHeaderrow(context),
                          _buildColumnenvoltori(context),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomElevatedButton(
                      text: "Continuar Registro",
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.fishingVesselsScreen);
                      },
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
        text: "Comunmente encontrados",
        margin: EdgeInsets.only(right: 96.h),
      ),
    );
  }

  Widget _buildButtontwo(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Listado de comunmente encontrados",
              style: theme.textTheme.titleMedium,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.addFoundObjectScreen);
            },
            constraints: BoxConstraints(
              minHeight: 50.h,
              minWidth: 50.h,
            ),
            padding: EdgeInsets.all(0),
            icon: SizedBox(
              width: 50.h,
              height: 50.h,
              child: CustomImageView(
                imagePath: ImageConstant.button,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderrow(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray400,
            width: 1.h,
          ),
        ),
      ),
      width: double.maxFinite,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 16.h,
                top: 14.h,
                bottom: 14.h,
              ),
              decoration: BoxDecoration(
                color: appTheme.gray10001,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nombre",
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: appTheme.gray10001,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnenvoltori(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: appTheme.gray50001,
                  width: 1.h,
                ),
              ),
            ),
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 2.h),
                        Text(
                          "Envoltorios de comida",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            height: 1.43,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 34.h),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          decoration: BoxDecoration(
                            color: appTheme.gray50,
                            borderRadius: BorderRadiusStyle.circleBorder10,
                            border: Border.all(
                              color: appTheme.lime500,
                              width: 1.h,
                            ),
                          ),
                          child: Text(
                            "20",
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.titleSmallLime500,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapAddFoundObject(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addFoundObjectScreen);
  }
}
