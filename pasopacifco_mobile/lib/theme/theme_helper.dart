import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';

String _appTheme = 'lightCode';
LightCodeColors get appTheme => ThemeHelper()._getThemeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  // A map of color schemes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  // Changes the app theme
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  LightCodeColors _getThemeColor() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            horizontal: -4,
            vertical: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          color: colorScheme.onPrimaryContainer,
          width: 1,
        ),
        visualDensity: const VisualDensity(
          horizontal: -4,
          vertical: -4,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.onPrimaryContainer,
      ),
      dividerTheme: DividerThemeData(
        thickness: 16,
        space: 16,
        color: appTheme.gray600,
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColor();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray800,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray800,
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black90001,
          fontSize: 12,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w300,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 28.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 24.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 20.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 16.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 14.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFFB1C246),
    primaryContainer: Color(0XFF333639),
    secondaryContainer: Color(0XFF00FF40),
    errorContainer: Color(0XFF757575),
    onErrorContainer: Color(0XFF121212),
    onPrimary: Color(0XFF1E1E2D),
    onPrimaryContainer: Color(0XFFFFFFFF),
  );
}

class LightCodeColors {
  Color get black900 => Color(0XFF0A0A0A);
  Color get black90001 => Color(0XFF000000);

  Color get blue100 => Color(0XFFC9D5FF);
  Color get blue600 => Color(0XFF1A73E8);
  Color get blueA700 => Color(0XFF0066FF);
  Color get blueA70001 => Color(0XFF225FFF);

  Color get blueGray100 => Color(0XFFD2D2D2);
  Color get blueGray200 => Color(0XFFB5D0C9);
  Color get blueGray800 => Color(0XFF3E3F5E);
  Color get blueGray900 => Color(0XFF232533);

  Color get cyan50 => Color(0XFFE6F9F5);

  Color get deepOrange400 => Color(0XFFFE6F5E);
  Color get deepOrange50 => Color(0XFFFFE7E7);
  Color get deepOrangeA700 => Color(0XFFF51717);

  Color get gray100 => Color(0XFFF4F4F4);
  Color get gray10001 => Color(0XFFF5F5F5);
  Color get gray300 => Color(0XFFE0E0E0);
  Color get gray30001 => Color(0XFFDBDDE0);
  Color get gray400 => Color(0XFFC2C2C2);
  Color get gray50 => Color(0XFFF7F4FF);
  Color get gray500 => Color(0XFFA2A2A7);
  Color get gray50001 => Color(0XFF9E9E9E);
  Color get gray600 => Color(0XFF717375);
  Color get gray60001 => Color(0XFF707070);
  Color get gray700 => Color(0XFF585858);
  Color get gray70001 => Color(0XFF616161);
  Color get gray800 => Color(0XFF424242);
  Color get gray80001 => Color(0XFF4E4E4E);
  Color get gray80002 => Color(0XFF3F3F3F);
  Color get gray900 => Color(0XFF161622);
// Indigo
  Color get indigo900 => Color(0XFF0B2B70);
// Lime
  Color get lime500 => Color(0XFFE0CE2C);
  Color get lime600 => Color(0XFFBACF35);
// Pink
  Color get pink100 => Color(0XFFE2B6B6);
// Red
  Color get red600 => Color(0XFFE23D28);
}
