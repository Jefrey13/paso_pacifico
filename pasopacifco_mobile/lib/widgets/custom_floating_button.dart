import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';

class CustomFloatingButton extends StatelessWidget {
  final Alignment? alignment;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final ShapeBorder? shape;
  final double? width;
  final double? height;
  final Decoration? decoration;
  final Widget? child;

  CustomFloatingButton({
    Key? key,
    this.alignment,
    this.backgroundColor,
    this.onTap,
    this.shape,
    this.width,
    this.height,
    this.decoration,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment ?? Alignment.center, child: fabWidget)
        : fabWidget;
  }

  Widget get fabWidget => FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: onTap,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
        child: Container(
          alignment: Alignment.center,
          width: width ?? 0,
          height: height ?? 0,
          decoration: decoration ??
              BoxDecoration(
                color: theme.colorScheme.onPrimaryContainer,
                borderRadius: BorderRadius.circular(28),
              ),
          child: child,
        ),
      );
}
