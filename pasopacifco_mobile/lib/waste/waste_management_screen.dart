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

class WasteManagementScreen extends StatelessWidget {
  WasteManagementScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();
  TextEditingController headertaboneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 8.h, top: 16.h, right: 8.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [_buildContainer(context)],
            )),
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
        text: "Gestión de residuos",
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: CustomSearchView(
              controller: searchController,
              hintText: "Buscar resiudo de limpieza",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 14.h,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.maxFinite,
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Lista de residuos",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.addWasteScreen);
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
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: 342.h,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: appTheme.gray400,
                      width: 1.h,
                    ),
                  ),
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          height: 48.h,
                          text: "Nombre",
                          buttonStyle: CustomButtonStyles.fillGray,
                          buttonTextStyle: theme.textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        child: CustomElevatedButton(
                          height: 48.h,
                          text: "Categoria",
                          buttonStyle: CustomButtonStyles.fillGray,
                          buttonTextStyle: theme.textTheme.titleSmall,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: GestureDetector(
                    onTap: () => onTapEditWaste(context),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: appTheme.gray400,
                            width: 1.h,
                          ),
                        ),
                      ),
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
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cohetes",
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
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Otros residuos",
                                    style: CustomTextStyles.bodyMediumPrimary_1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapEditWaste(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editWasteScreen);
  }
}
