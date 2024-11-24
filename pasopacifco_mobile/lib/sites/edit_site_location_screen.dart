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

class EditSiteLocationScreen extends StatelessWidget {
  EditSiteLocationScreen({Key? key}) : super(key: key);

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
                        _buildInput(context),
                        SizedBox(height: 16.h),
                        _buildInputone(context),
                        SizedBox(height: 16.h),
                        Text(
                          "Departamento",
                          style: theme.textTheme.bodyLarge,
                        ),
                        SizedBox(height: 16.h),
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
                        Text(
                          "Municipio",
                          style: theme.textTheme.bodyLarge,
                        ),
                        SizedBox(height: 16.h),
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
                            items: dropdownItemList1,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 14.h),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _buildInputtwo(context),
                        SizedBox(height: 16.h),
                        Text(
                          "Modalidad de Limpieza",
                          style: theme.textTheme.bodyLarge,
                        ),
                        SizedBox(height: 16.h),
                        _buildOptions(context),
                        SizedBox(height: 24.h),
                        _buildBotton(context),
                      ],
                    ),
                  ),
                  SizedBox(height: 34.h)
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

  Widget _buildOptions(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCheckboxButton(
          text: "Terrestre",
          value: terrestreone,
          onChange: (value) {
            terrestreone = value;
          },
        ),
        SizedBox(width: 26.h),
        CustomCheckboxButton(
          text: "Embarcación",
          value: embarcacinone,
          onChange: (value) {
            embarcacinone = value;
          },
        ),
        SizedBox(width: 26.h),
        CustomCheckboxButton(
          text: "Submarina",
          value: submarinaone,
          onChange: (value) {
            submarinaone = value;
          },
        ),
      ],
    );
  }

/*
  Widget _buildGuardar(BuildContext context) {
    return CustomElevatedButton(
      height: 56.h,
      text: "Guardar",
      buttonStyle: CustomButtonStyles.fillPrimaryTL16,
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
    );
  }*/

  Widget _buildActualizar(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 56.h,
        text: "Actualizar",
        buttonStyle: CustomButtonStyles.fillPrimaryTL16,
        buttonTextStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
      ),
    );
  }

  Widget _buildDesactivar(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 56.h,
        text: "Desactivar",
        margin: EdgeInsets.only(left: 10.h),
        buttonStyle: CustomButtonStyles.fillRedTL4,
        buttonTextStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
        onPressed: () {},
      ),
    );
  }

  /// Section Widget
  Widget _buildBotton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [_buildActualizar(context), _buildDesactivar(context)],
      ),
    );
  }
}
