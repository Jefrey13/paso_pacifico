import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';

class HomeTwoItemWidget extends StatelessWidget {
  HomeTwoItemWidget({Key? key, this.onTapColumngestin}) : super(key: key);

  VoidCallback? onTapColumngestin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumngestin?.call();
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimaryContainer,
          borderRadius: BorderRadiusStyle.roundedBorder6,
          boxShadow: [
            BoxShadow(
              color: appTheme.black90001.withOpacity(0.1),
              spreadRadius: 2.h,
              offset: Offset(
                0,
                6,
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.site,
              height: 60.h,
              width: 62.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Gestión de Sitios",
              style: CustomTextStyles.bodyLargeOnPrimary,
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}
