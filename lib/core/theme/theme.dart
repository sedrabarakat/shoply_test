
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,

      scaffoldBackgroundColor: AppColors.backgroundColor,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        foregroundColor: AppColors.black,
        centerTitle: false,
      ),

      dropdownMenuTheme: DropdownMenuThemeData()
    );
  }
}
