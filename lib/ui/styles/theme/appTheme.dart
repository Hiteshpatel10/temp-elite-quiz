import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterquiz/ui/styles/colors.dart';
import 'package:flutterquiz/utils/constants/fonts.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    canvasColor: klCanvasColor,
    fontFamily: GoogleFonts.nunito().fontFamily,
    primaryColor: klPrimaryColor,
    primaryTextTheme: GoogleFonts.nunitoTextTheme(),
    cupertinoOverrideTheme: _cupertinoOverrideTheme,
    scaffoldBackgroundColor: klPageBackgroundColor,
    dialogTheme: _dialogThemeData,
    shadowColor: klPrimaryColor.withOpacity(0.25),
    dividerTheme: _dividerThemeData,
    textTheme: GoogleFonts.nunitoTextTheme(),
    textButtonTheme: _textButtonTheme,
    tabBarTheme: _tabBarTheme,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    radioTheme: const RadioThemeData(
      fillColor: MaterialStatePropertyAll<Color>(klPrimaryTextColor),
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
          background: klBackgroundColor,
          onTertiary: klPrimaryTextColor,
        ),
  ),
  AppTheme.dark: ThemeData(
    primaryTextTheme: GoogleFonts.nunitoTextTheme(),
    textTheme: GoogleFonts.nunitoTextTheme(),
    fontFamily: GoogleFonts.nunito().fontFamily,
    shadowColor: kdPrimaryColor.withOpacity(0.25),
    brightness: Brightness.dark,
    primaryColor: kdPrimaryColor,
    scaffoldBackgroundColor: kdPageBackgroundColor,
    dialogTheme: _dialogThemeData.copyWith(
      backgroundColor: kdPageBackgroundColor,
      surfaceTintColor: kdPageBackgroundColor,
      titleTextStyle: _dialogThemeData.titleTextStyle?.copyWith(
        color: kdPrimaryTextColor,
      ),
    ),
    canvasColor: kdCanvasColor,
    tabBarTheme: _tabBarTheme.copyWith(
      labelColor: kdCanvasColor,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: klPrimaryColor,
      ),
    ),
    textButtonTheme: _textButtonTheme,
    dividerTheme: _dividerThemeData,
    cupertinoOverrideTheme: _cupertinoOverrideTheme,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    radioTheme: const RadioThemeData(
      fillColor: MaterialStatePropertyAll<Color>(kdPrimaryTextColor),
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
          brightness: Brightness.dark,
          background: kdBackgroundColor,
          onTertiary: kdPrimaryTextColor,
        ),
  ),
};

final _textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
);

const _dividerThemeData = DividerThemeData(
  color: Colors.black12,
  thickness: .5,
);

final _dialogThemeData = DialogTheme(
  alignment: Alignment.center,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  titleTextStyle: GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeights.regular,
      color: klPrimaryTextColor,
    ),
  ),
  shadowColor: Colors.transparent,
  surfaceTintColor: klPageBackgroundColor,
  backgroundColor: klPageBackgroundColor,
);

final _cupertinoOverrideTheme = NoDefaultCupertinoThemeData(
  textTheme: CupertinoTextThemeData(textStyle: GoogleFonts.nunito()),
);

final _tabBarTheme = TabBarTheme(
  tabAlignment: TabAlignment.center,
  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
  dividerHeight: 0,
  labelColor: klBackgroundColor,
  labelStyle: GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontWeight: FontWeights.regular,
      fontSize: 14,
    ),
  ),
  unselectedLabelColor: Colors.black26,
  indicatorSize: TabBarIndicatorSize.tab,
  indicator: BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: klPrimaryColor,
  ),
);
