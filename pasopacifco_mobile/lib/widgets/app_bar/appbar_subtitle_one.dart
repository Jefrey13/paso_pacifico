import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/widgets/custom_icon_button.dart';

class AppbarSubtitleOne extends StatelessWidget {
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  AppbarSubtitleOne({
    Key? key,
    required this.text,
    required this.onTap,
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
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.h,
            ),
            border: Border.all(
              color: appTheme.blueGray100,
              width: 1.h,
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: CustomTextStyles.bodyLargeGray80002.copyWith(
              color: appTheme.gray80002,
            ),
          ),
        ),
      ),
    );
  }
}
