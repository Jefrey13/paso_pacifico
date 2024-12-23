import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_checkbox_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_drop_dowm.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:path/path.dart';

class SiteLocationScreen extends StatelessWidget {
  SiteLocationScreen({Key? key}) : super(key: key);

  TextEditingController inputinneroneController = TextEditingController();
  TextEditingController inputinnerController = TextEditingController();
  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];
  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];
  TextEditingController countryController = TextEditingController();
  bool terrestreone = true;
  bool embarcacinone = true;
  bool submarinaone = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 4.h,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detalles del Sitio Seleccionado",
                          style: CustomTextStyles.titleSmallBlack90001,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Nombre del sitio",
                          style: theme.textTheme.bodyLarge,
                        ),
                        SizedBox(height: 16.h),
                        //_buildInput(context),
                        Padding(
                          padding: EdgeInsets.only(right: 12.h),
                          child: CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(left: 16.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.arrowdown,
                                height: 18.h,
                                width: 24.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            iconSize: 18.h,
                            hintText: "Seleccionar",
                            items: dropdownItemList,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 14.h),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _buildInputone(context),
                        SizedBox(height: 16.h),
                        _buildInputDepto(context),
                        SizedBox(height: 16.h),
                        _buildInputMuni(context),
                        SizedBox(height: 16.h),
                        _buildInputtwo(context),
                      ],
                    ),
                  ),
                  SizedBox(height: 52.h)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildColumnguardar(context),
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
        text: "Ubicación del Sitio",
        margin: EdgeInsets.only(right: 96.h),
      ),
    );
  }

  Widget _buildInputinnerone(BuildContext context) {
    return CustomTextFormField(
      controller: inputinneroneController,
      hintText: "Nombre del sitio",
      hintStyle: CustomTextStyles.bodyMediumErrorContainer,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.h,
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sitio",
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 4.h),
          _buildInputinnerone(context)
        ],
      ),
    );
  }

  Widget _buildInputinner(BuildContext context) {
    return CustomTextFormField(
      controller: inputinnerController,
      hintText: "Nombre del cruce",
      hintStyle: CustomTextStyles.bodyMediumErrorContainer,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.h,
      ),
    );
  }

  Widget _buildInputone(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cruce mas cercano",
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 4.h),
          _buildInputinner(context)
        ],
      ),
    );
  }

  Widget _buildCountry(BuildContext context) {
    return CustomTextFormField(
      controller: countryController,
      hintText: "Nicaragua",
      hintStyle: CustomTextStyles.bodyMediumErrorContainer,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.h,
      ),
    );
  }

  Widget _buildInputtwo(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pais",
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 4.h),
          _buildCountry(context)
        ],
      ),
    );
  }

  Widget _buildInputDepto(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Departamento",
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 4.h),
          _buildDepto(context)
        ],
      ),
    );
  }

  Widget _buildDepto(BuildContext context) {
    return CustomTextFormField(
      controller: countryController,
      hintText: "Carazo",
      hintStyle: CustomTextStyles.bodyMediumErrorContainer,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.h,
      ),
    );
  }

  Widget _buildInputMuni(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Municipio",
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 4.h),
          _buildMuni(context)
        ],
      ),
    );
  }

  Widget _buildMuni(BuildContext context) {
    return CustomTextFormField(
      controller: countryController,
      hintText: "Casares",
      hintStyle: CustomTextStyles.bodyMediumErrorContainer,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.h,
      ),
    );
  }

  Widget _buildGuardar(BuildContext context) {
    return CustomElevatedButton(
      text: "Continuar Registro",
      margin: EdgeInsets.only(bottom: 12.h),
      onPressed: () => Navigator.pushNamed(
        context,
        AppRoutes.loadImageScreen,
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnguardar(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildGuardar(context)],
      ),
    );
  }
}
