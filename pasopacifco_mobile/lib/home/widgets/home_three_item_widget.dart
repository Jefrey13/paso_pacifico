import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';

class HomeThreeItemWidget extends StatelessWidget {
  HomeThreeItemWidget({Key? key, this.onTapColumntrash}) : super(key: key);

  VoidCallback? onTapColumntrash;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumntrash?.call();
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
              imagePath: ImageConstant.trash,
              height: 60.h,
              width: 62.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Gestión de Resiudos",
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
