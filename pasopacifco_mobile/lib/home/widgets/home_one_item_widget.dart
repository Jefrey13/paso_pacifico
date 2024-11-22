import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';

class HomeOneItemWidget extends StatelessWidget {
  HomeOneItemWidget({Key? key, this.onTapColumnusers}) : super(key: key);

  VoidCallback? onTapColumnusers;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumnusers?.call();
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
              imagePath: ImageConstant.user,
              height: 60.h,
              width: 62.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Gestión de Usuarios",
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

/*
  Widget _buildColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 12.h,
        right: 8.h,
      ),
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "Opciones".toUpperCase(),
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 28.h),
                ResponsiveGridListBuilder(
                  minItemWidth: 1,
                  minItemsPerRow: 2,
                  maxItemsPerRow: 2,
                  horizontalGridSpacing: 12.h,
                  verticalGridSpacing: 12.h,
                  builder: (context, items) => ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: items,
                  ),
                  gridItems: List.generate(
                    1,
                    (index) {
                      return HomeOneItemWidget(
                        onTapColumngestin: () {},
                      );
                    },
                  ).toSet().toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
}
