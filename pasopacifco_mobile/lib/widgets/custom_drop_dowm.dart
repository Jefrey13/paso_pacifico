import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';

extension DropDownStyleHelper on CustomDropDown {
  static OutlineInputBorder get outlineGray => OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.gray400,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineGrayTL4 => OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.gray400,
          width: 1,
        ),
      );
  static UnderlineInputBorder get underLine => UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineGray1 => OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.gray400,
          width: 1,
        ),
      );
}

class CustomDropDown extends StatelessWidget {
  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final FocusNode? focusNode;
  final Widget? icon;
  final double? iconSize;
  final bool? autofocus;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final List<String>? items;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  CustomDropDown({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.focusNode,
    this.icon,
    this.iconSize,
    this.autofocus = false,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.items,
    this.prefix,
    this.prefixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment ?? Alignment.center, child: dropDownWidget)
        : dropDownWidget;
  }

  Widget get dropDownWidget => Container(
        width: width ?? double.maxFinite,
        decoration: boxDecoration,
        child: DropdownButtonFormField(
            focusNode: focusNode,
            icon: icon,
            iconSize: iconSize ?? 24,
            autofocus: autofocus!,
            isExpanded: true,
            style: textStyle ?? CustomTextStyles.titleSmallBlack90001,
            hint: Text(
              hintText ?? "",
              style: hintStyle ?? CustomTextStyles.bodyMediumErrorContainer,
              overflow: TextOverflow.ellipsis,
            ),
            items: items?.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style:
                        hintStyle ?? CustomTextStyles.bodyMediumErrorContainer,
                  ));
            }).toList(),
            decoration: decoration,
            validator: validator,
            onChanged: (value) {
              onChanged!(value.toString());
            }),
      );
  InputDecoration get decoration => InputDecoration(
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
        fillColor: fillColor ?? appTheme.gray10001,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
        focusedBorder: (borderDecoration ?? OutlineInputBorder()).copyWith(
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 1,
          ),
        ),
      );
}
