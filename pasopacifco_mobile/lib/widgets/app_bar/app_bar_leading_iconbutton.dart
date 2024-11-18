import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/widgets/custom_icon_button.dart';

class AppbarLeadingIconButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  AppbarLeadingIconButton({
    Key? key,
    this.height,
    this.width,
    this.imagePath,
    this.onTap,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 42.h,
          width: width ?? 42.h,
          padding: EdgeInsets.all(10.h),
          decoration: IconButttonStyleHelper.none,
          child: Image.asset(
            imagePath ?? ImageConstant.back,
          ),
        ),
      ),
    );
  }
}
