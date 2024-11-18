import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/widgets/custom_icon_button.dart';

class AppbarTitle extends StatelessWidget {
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  AppbarTitle({
    Key? key,
    required this.text,
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
        child: Text(
          text,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
