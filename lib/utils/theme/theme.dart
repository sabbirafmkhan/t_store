import 'package:flutter/material.dart';
import 'package:t_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:t_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:t_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:t_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:t_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:t_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:t_store/utils/theme/custom_themes/text_theme.dart';
import 'package:t_store/utils/theme/custom_themes/bottom_sheet_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightTChipTheme,
    appBarTheme: TAppBarTheme.lightTAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightTCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightTBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightTOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightTTextFormFieldTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkTChipTheme,
    appBarTheme: TAppBarTheme.darkTAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkTCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkTBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkTOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkTTextFormFieldTheme,
  );
}
