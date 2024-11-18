import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/widgets/custom_icon_button.dart';

class AppbarSubtitle extends StatelessWidget {
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  AppbarSubtitle({Key? key, required this.text, this.onTap, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: SizedBox(
          width: 226.h,
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodyLargeOnPrimary18.copyWith(
              color: theme.colorScheme.onPrimary,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
