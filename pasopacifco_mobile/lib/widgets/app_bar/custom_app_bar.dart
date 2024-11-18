import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/widgets/custom_icon_button.dart';

enum Style { bgShadowBlack90001 }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final ShapeBorder? shape;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  CustomAppBar(
      {Key? key,
      this.height,
      this.shape,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions})
      : super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shape: shape,
      toolbarHeight: height ?? 56.h,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 56.h,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgShadowBlack90001:
        return Container(
          height: 110.h,
          width: 374.h,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimaryContainer,
            boxShadow: [
              BoxShadow(
                color: appTheme.black90001.withOpacity(0.12),
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: Offset(
                  0,
                  4,
                ),
              )
            ],
          ),
        );
      default:
        return null;
    }
  }
}
