import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/theme/custom_button_style.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_checkbox_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_drop_dowm.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:path/path.dart';

class ManagementElementsWidget extends StatelessWidget {
  ManagementElementsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.blue100,
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.image_not_found,
            width: 106.h,
            height: 106.h,
            radius: BorderRadius.circular(52.h),
          ),
          SizedBox(width: 8.h),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "La Boquita",
                      style:
                          CustomTextStyles.titleSmallLeagueSpartanOnPrimary_1,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Carazo",
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfo(context),
                          CustomImageView(
                            imagePath: ImageConstant.vector,
                            width: 1.h,
                            height: 1.h,
                            margin: EdgeInsets.only(
                              left: 42.h,
                              top: 6.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return CustomElevatedButton(
      height: 22.h,
      width: 46.h,
      text: "Info",
      buttonStyle: CustomButtonStyles.fillPrimaryTL10,
      buttonTextStyle:
          CustomTextStyles.bodyMediumLeagueSpartanOnPrimaryContainer,
      alignment: Alignment.center,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.editSiteLocationScreen);
      },
    );
  }
}
