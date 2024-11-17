import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/theme/theme_helper.dart';

extension on TextStyle {
  TextStyle get openSans {
    return copyWith(fontFamily: 'OpenSans');
  }

  TextStyle get roboto {
    return copyWith(fontFamily: 'Roboto');
  }

  TextStyle get leagueSpartan {
    return copyWith(fontFamily: 'League Spartan');
  }

  TextStyle get sFProText {
    return copyWith(fontFamily: 'SF Pro Text');
  }

  TextStyle get jaldi {
    return copyWith(fontFamily: 'Jaldi');
  }
}

class CustomTextStyles {
  static TextStyle get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );

  static TextStyle get bodyLargeBlack900001 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90001,
      );

  static TextStyle get bodyLargeBlack90001_1 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90001,
      );

  static TextStyle get bodyLargeGray60001 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray60001,
      );

  static TextStyle get bodyLargeGray80002 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray80002,
      );
  static TextStyle get bodyLargeOnPrimary =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static TextStyle get bodyLargeOnPrimary18 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 18.0,
      );

  static TextStyle get bodyLargeOnPrimaryContainer =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );

  static TextStyle get bodyMediumBlack900 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );

  static TextStyle get bodyMediumBlack90001 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90001,
      );

  static TextStyle get bodyMediumBlueA700 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueA700,
      );

  static TextStyle get bodyMediumBluegray900 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray900,
      );

  static TextStyle get bodyMediumDeeporange400 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.deepOrange400,
      );

  static TextStyle get bodyMediumErrorContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );

  static TextStyle get bodyMediumGray500 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );

  static TextStyle get bodyMediumGray60001 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60001,
      );

  static TextStyle get bodyMediumGray60001_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60001,
      );

  static TextStyle get bodyMediumGray70001 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray70001,
      );

  static TextStyle get bodyMediumJaldiIndigo900 =>
      theme.textTheme.bodyMedium!.jaldi.copyWith(
        color: appTheme.indigo900,
      );

  static TextStyle get bodyMediumLeagueSpartanBlack90001 =>
      theme.textTheme.bodyMedium!.leagueSpartan.copyWith(
        color: appTheme.black90001,
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get bodyMediumLeagueSpartanBlack90001Light =>
      theme.textTheme.bodyMedium!.leagueSpartan.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get bodyMediumLeagueSpartanOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.leagueSpartan.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 15.0,
      );

  static TextStyle get bodyMediumOnPrimary =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static TextStyle get bodyMediumPrimary =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

  static TextStyle get bodyMediumPrimary_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

  static TextStyle get bodySmallRobotoGray60001 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.gray60001,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get headlineSmallOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
// Label text style
  static TextStyle get labelLargeRed600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.red600,
      );
  static TextStyle get labelLargeSecondaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
// Title text style
  static TextStyle get titleMediumLeagueSpartanOnPrimary =>
      theme.textTheme.titleMedium!.leagueSpartan.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static TextStyle get titleMediumSFProTextOnErrorContainer =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallBlack90001 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
      );

  static TextStyle get titleSmallGray60001 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray60001,
      );

  static TextStyle get titleSmallGray60001SemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray60001,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallLeagueSpartanOnPrimary =>
      theme.textTheme.titleSmall!.leagueSpartan.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 15.0,
      );

  static TextStyle get titleSmallLeagueSpartanOnPrimary_1 =>
      theme.textTheme.titleSmall!.leagueSpartan.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static TextStyle get titleSmallLime500 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.lime500,
      );

  static TextStyle get titleSmallOnPrimary =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static TextStyle get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );

  static TextStyle get titleSmallOpenSansBluegray800 =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: appTheme.blueGray800,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallOpenSansOnPrimaryContainer =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w600,
      );
}
