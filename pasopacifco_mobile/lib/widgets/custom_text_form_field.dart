import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static UnderlineInputBorder get underLineGray => UnderlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.gray400,
        ),
      );
  static UnderlineInputBorder get underLine => UnderlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.gray400,
          width: 1,
        ),
      );
  static OutlineInputBorder get fillOnPrimaryContainer => OutlineInputBorder(
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get outlineGray1 => OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.gray400,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineGray2 => OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.gray400,
          width: 1,
        ),
      );
  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderSide: BorderSide.none,
      );
}

class CustomTextFormField extends StatelessWidget {
  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;

  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => Container(
        width: width ?? double.maxFinite,
        decoration: boxDecoration,
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus,
          style: textStyle ?? theme.textTheme.titleSmall,
          obscureText: obscureText,
          readOnly: readOnly,
          onTap: () {
            onTap?.call();
          },
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.bodyMediumDeeporange400,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
        fillColor: fillColor ?? theme.colorScheme.onPrimaryContainer,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: appTheme.gray400,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: appTheme.gray400,
                width: 1,
              ),
            ),
        focusedBorder: (borderDecoration ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ))
            .copyWith(
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 1,
          ),
        ),
      );
}
