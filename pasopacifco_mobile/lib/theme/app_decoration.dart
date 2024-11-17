import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/theme/theme_helper.dart';

class AppDecoration {
  static BoxDecoration get dangerBorder => BoxDecoration(
        color: appTheme.deepOrange50,
        border: Border.all(
          color: appTheme.pink100,
          width: 1.0,
        ),
      );
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black90001.withOpacity(0.8),
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue100,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray900.withOpacity(0.12),
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );
  static BoxDecoration get gray0210 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get gray0220 => BoxDecoration(
        color: appTheme.gray10001,
      );
  static BoxDecoration get gray0250 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray400,
            width: 1.0,
          ),
        ),
      );
  static BoxDecoration get gray0250Gray0220 => BoxDecoration(
        color: appTheme.gray10001,
        border: Border(
          top: BorderSide(
            color: appTheme.gray400,
            width: 1.0,
          ),
          bottom: BorderSide(
            color: appTheme.gray400,
            width: 1.0,
          ),
          right: BorderSide(
            color: appTheme.gray400,
            width: 1.0,
          ),
        ),
      );
  static BoxDecoration get gray0260 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray50001,
            width: 1.0,
          ),
        ),
      );
  static BoxDecoration get gray0260ColorsWhite1 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        border: Border.all(
          color: appTheme.gray50001,
          width: 1.0,
        ),
      );
  static BoxDecoration get gray0290 => BoxDecoration();

  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90001.withOpacity(0.24),
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlack90001 => BoxDecoration(
        border: Border.all(
          color: appTheme.black90001,
          width: 1.0,
        ),
      );
  static BoxDecoration get outlineBlack900011 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90001.withOpacity(0.12),
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray100,
          width: 1.0,
        ),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.gray10001,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray400,
            width: 1.0,
          ),
          right: BorderSide(
            color: appTheme.gray400,
            width: 1.0,
          ),
        ),
      );
  static BoxDecoration get primarymain => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get primarymainPrimarySecondary => BoxDecoration(
        color: appTheme.gray50,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.0,
        ),
      );
  static BoxDecoration get shadow6 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90001.withOpacity(0.1),
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: Offset(
              0,
              6,
            ),
          )
        ],
      );
// Success decorations
  static BoxDecoration get successBorder => BoxDecoration(
        color: appTheme.cyan50,
        border: Border.all(
          color: appTheme.blueGray200,
          width: 1.0,
        ),
      );
  static BoxDecoration get warningmain => BoxDecoration(
        color: appTheme.cyan50,
        border: Border.all(
          color: appTheme.lime500,
          width: 1.0,
        ),
      );
  static BoxDecoration get warningmainPrimarySecondary => BoxDecoration(
        color: appTheme.gray50,
        border: Border.all(
          color: appTheme.lime500,
          width: 1.0,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder10 => BorderRadius.circular(
        10.0,
      );
// Custom borders
  static BorderRadius get customBorderTL40 => BorderRadius.vertical(
        top: Radius.circular(40.0),
      );
// Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1.0,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.0,
      );
  static BorderRadius get roundedBorder44 => BorderRadius.circular(
        44.0,
      );
  static BorderRadius get roundedBorder52 => BorderRadius.circular(
        52.0,
      );
  static BorderRadius get roundedBorder6 => BorderRadius.circular(
        6.0,
      );
}
