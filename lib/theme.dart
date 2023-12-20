// ignore_for_file: annotate_overrides, overridden_fields
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:google_fonts/google_fonts.dart';

const kThemeModeKey = '__theme_mode__';
const fontFamily = 'Lato';

SharedPreferences? _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class WhatCardTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  // Init by getting shared pref instance
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  // Get curr theme mode
  static ThemeMode get themeMode {
    // Dark mode bool
    final darkMode = _prefs?.getBool(kThemeModeKey);

    // If darkmode does not exist in shared prefs, return system choice
    if (darkMode == null) return ThemeMode.system;

    // Else return users choice
    return darkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static WhatCardTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color secondaryGray;
  late Color primaryGray;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
      }[deviceSize]!;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;

  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;

  String get dataText1Family => typography.dataText1Family;
  TextStyle get dataText1 => typography.dataText1;
  String get dataText2Family => typography.dataText2Family;
  TextStyle get dataText2 => typography.dataText2;

  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;
}

class LightModeTheme extends WhatCardTheme {
  late Color primaryColor = const Color(0xFF0369EF);
  late Color secondaryColor = const Color(0xFFFFFFFF);
  late Color tertiaryColor = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFFF5963);

  late Color primaryBackground = Colors.white;
  late Color secondaryBackground = Colors.black.withOpacity(0.03);

  late Color primaryText = Colors.black;
  late Color secondaryText = Colors.white;

  late Color secondaryGray = const Color(0xFFDBE2E7);
  late Color primaryGray = const Color(0xFF57636C);
}

class DarkModeTheme extends WhatCardTheme {
  late Color primaryColor = const Color(0xFF0369EF);
  late Color secondaryColor = const Color(0xFFFFFFFF);
  late Color tertiaryColor = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFFF5963);

  late Color primaryBackground = Colors.white;
  late Color secondaryBackground = Colors.black.withOpacity(0.03);

  late Color primaryText = Colors.black;
  late Color secondaryText = Colors.white;

  late Color secondaryGray = const Color(0xFFDBE2E7);
  late Color primaryGray = const Color(0xFF57636C);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;

  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;

  String get dataText1Family;
  TextStyle get dataText1;
  String get dataText2Family;
  TextStyle get dataText2;

  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final WhatCardTheme theme;

  String get title1Family => fontFamily;
  TextStyle get title1 => GoogleFonts.getFont(
        fontFamily,
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  String get title2Family => fontFamily;
  TextStyle get title2 => GoogleFonts.getFont(
        fontFamily,
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  String get title3Family => fontFamily;
  TextStyle get title3 => GoogleFonts.getFont(
        fontFamily,
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );

  String get subtitle1Family => fontFamily;
  TextStyle get subtitle1 => GoogleFonts.getFont(
        fontFamily,
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  String get subtitle2Family => fontFamily;
  TextStyle get subtitle2 => GoogleFonts.getFont(
        fontFamily,
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );

  String get dataText1Family => fontFamily;
  TextStyle get dataText1 => GoogleFonts.getFont(
        fontFamily,
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      );
  String get dataText2Family => fontFamily;
  TextStyle get dataText2 => GoogleFonts.getFont(
        fontFamily,
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      );

  String get bodyText1Family => fontFamily;
  TextStyle get bodyText1 => GoogleFonts.getFont(
        fontFamily,
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  String get bodyText2Family => fontFamily;
  TextStyle get bodyText2 => GoogleFonts.getFont(
        fontFamily,
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}
