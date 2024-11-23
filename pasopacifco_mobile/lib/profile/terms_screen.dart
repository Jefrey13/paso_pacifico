import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';

class TermsScreen extends StatelessWidget {
  TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(
            top: 16.h,
            bottom: 24.h,
          ),
          child: Container(
            width: 374.h,
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.Logo),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Text(
                  "",
                  maxLines: 33,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumBluegray900.copyWith(
                    height: 1.43,
                  ),
                ),
              ],
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
        text: "Términos y Condiciones",
        margin: EdgeInsets.only(right: 48.h),
      ),
    );
  }
}
