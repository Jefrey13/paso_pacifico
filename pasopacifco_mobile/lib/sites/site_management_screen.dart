import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
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

class SiteManagementScreen extends StatelessWidget {
  SiteManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 16.h,
            right: 6.h,
            top: 16.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildAgregar(context),
              SizedBox(height: 22.h),
              _buildGestinde(context)
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
        text: "Gestión de sitios",
      ),
    );
  }

  Widget _buildAgregar(BuildContext context) {
    return CustomElevatedButton(
      height: 36.h,
      width: 82.h,
      text: "Agregar",
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.addSiteLocationScreen);
      },
      alignment: Alignment.centerRight,
    );
  }

  Widget _buildGestinde(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 12.h,
        ),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 14.h,
            );
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return ManagementElementsWidget();
          },
        ),
      ),
    );
  }

  onTapAddSite(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addSiteLocationScreen);
  }
}
