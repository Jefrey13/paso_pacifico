import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/sites/models/Site.dart';
import 'package:pasopacifco_mobile/theme/custom_button_style.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_image_view.dart';

class ManagementElementsWidget extends StatelessWidget {
  final Site site;
  final String departmentName;
  final String municipalityName;
  final VoidCallback onSiteEdited; // Callback para notificar cambios

  const ManagementElementsWidget({
    required this.site,
    required this.departmentName,
    required this.onSiteEdited,
    required this.municipalityName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.blue100,
        borderRadius: BorderRadiusStyle.roundedBorder16,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.image_not_found,
            width: 106.h,
            height: 106.h,
            radius: BorderRadius.circular(52.h),
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  site.name,
                  style: CustomTextStyles.titleSmallLeagueSpartanOnPrimary_1,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Departamento: $departmentName",
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Municipio: $municipalityName",
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    _buildInfo(context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return CustomElevatedButton(
      height: 36.h,
      width: 92.h,
      text: "Editar",
      buttonStyle: CustomButtonStyles.fillPrimaryTL10,
      buttonTextStyle:
          CustomTextStyles.bodyMediumLeagueSpartanOnPrimaryContainer,
      alignment: Alignment.center,
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoutes.editSiteLocationScreen,
          arguments: site,
        ).then((_) {
          // Invoca el callback después de regresar de la pantalla de edición
          onSiteEdited();
        });
      },
    );
  }
}
