import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/home/widgets/home_four_item_widget.dart';
import 'package:pasopacifco_mobile/home/widgets/home_one_item_widget.dart';
import 'package:pasopacifco_mobile/home/widgets/home_three_item_widget.dart';
import 'package:pasopacifco_mobile/home/widgets/home_two_item_widget.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

/*
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppbar(context),
            body: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      SizedBox(height: 4.h),
                      _buildColumnmegaphone(context),
                      SizedBox(height: 6.h),
                      SizedBox(
                        height: constraints.maxHeight -
                            200.h, // Adjust height based on device dimensions
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            _buildStackcoverprofi(context),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.onPrimaryContainer,
                                borderRadius:
                                    BorderRadiusStyle.customBorderTL40,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 28.h),
                                  _buildColumn(context),
                                  SizedBox(height: 44.h),
                                  _buildColumndescripti(context)
                                ],
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
          ),
        );
      },
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 4.h),
                  _buildColumnmegaphone(context),
                  SizedBox(height: 6.h),
                  SizedBox(
                    height: 600.h,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        _buildStackcoverprofi(context),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onPrimaryContainer,
                            borderRadius: BorderRadiusStyle.customBorderTL40,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 18.h),
                              _buildColumn(context),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 44.h),
                  _buildColumndescripti(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      height: 50.h,
      //leadingWidth: 59.h,
      leadingWidth: 50.h,
      leading: AppbarLeadingIconButton(
        imagePath: ImageConstant.arrowBack,
        margin: EdgeInsets.only(
          left: 17.h,
          top: 2.h,
          bottom: 6.h,
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildColumnmegaphone(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.menu,
                  width: 50.h,
                  height: 52.h,
                  alignment: Alignment.center,
                  onTap: () => onTapConfiguration(context),
                ),
                CustomImageView(
                  imagePath: ImageConstant.image_not_found,
                  width: 40.h,
                  height: 42.h,
                  margin: EdgeInsets.only(
                    left: 6.h,
                    top: 2.h,
                  ),
                  onTap: () {},
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.logo_home,
                  height: 42.h,
                  width: 46.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStackcoverprofi(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 212.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.cover_profile,
              height: 212.h,
              width: double.maxFinite,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.h,
                  top: 24.h,
                ),
                child: Text(
                  "Paso Pacífico".toUpperCase(),
                  style: CustomTextStyles.headlineSmallOnPrimaryContainer,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildColumns(BuildContext context) {
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
                  minItemWidth: 2,
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
                        onTapColumnusers: () {},
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

/*
  Widget _buildColumn(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.1,
      left: MediaQuery.of(context).size.width * 0.5 - 20,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(left: 12.h, right: 8.h),
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
                    minItemWidth: 2,
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
                      4,
                      (index) {
                        switch (index) {
                          case 0:
                            return HomeOneItemWidget(onTapColumnusers: () {});
                          case 1:
                            return HomeTwoItemWidget(onTapColumngestin: () {});
                          case 2:
                            return HomeThreeItemWidget(onTapColumntrash: () {});
                          case 3:
                            return HomeFourItemWidget(
                                onTapColumnreports: () {});
                          default:
                            return Container();
                        }
                      },
                    ).toSet().toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
*/

  Widget _buildColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 12.h, right: 8.h),
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
                  minItemWidth: 2,
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
                    4,
                    (index) {
                      switch (index) {
                        case 0:
                          return HomeOneItemWidget(onTapColumnusers: () {});
                        case 1:
                          return HomeTwoItemWidget(
                            onTapColumngestin: () => onTapSites(context),
                          );
                        case 2:
                          return HomeThreeItemWidget(
                              onTapColumntrash: () => onTapWaste(context));
                        case 3:
                          return HomeFourItemWidget(
                              onTapColumnreports: () => onTapReports(context));
                        default:
                          return Container();
                      }
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

  Widget _buildColumndescripti(BuildContext context) {
    /*
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
          right: 8.h,
          top: 20.h,
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: appTheme.gray10001,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              " © 2024 Paso Pacífico & UNAN-Managua, CUR-Carazo. \nTodos los derechos reservados.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyMediumGray60001_1.copyWith(
                height: 1.43,
              ),
            )
          ],
        ),
      ),
    );
  }*/
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: appTheme.gray100,
      ),
      child: Column(
        children: [
          Text(
            " © 2024 Paso Pacífico & UNAN-Managua, CUR-Carazo. \nTodos los derechos reservados.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodyMediumGray60001_1.copyWith(
              height: 1.43,
            ),
          )
        ],
      ),
    );
  }

  onTapConfiguration(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.configurationScreen);
  }

  onTapSites(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.siteManagementScreen);
  }

  onTapWaste(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.wasteManagementScreen);
  }

  onTapReports(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reportManagementScreen);
  }
}
