
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) =>
     TextStyle(
      fontFamily: AppFonts.defaultFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );


  // regular style
  static TextStyle getRegularStyle({double? fontSize, Color? color}) =>
      _getTextStyle(
      fontSize ?? FontSize.s16,
      FontWeightManager.regular,
      color ?? AppColors.black,
    );


  // light style
  static TextStyle getLightStyle({double? fontSize, Color? color}) =>
     _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.light,
      color ?? AppColors.lightFont,
    );


  // medium style
  static TextStyle getMediumStyle({double? fontSize, Color? color}) =>
     _getTextStyle(
      fontSize ?? FontSize.s18,
      FontWeightManager.medium,
      color ?? AppColors.black,
    );

  // extra bold style
  static TextStyle getExtraBoldStyle({double? fontSize, Color? color}) =>
      _getTextStyle(
        fontSize ?? FontSize.s20,
        FontWeightManager.bold,
        color ?? AppColors.black,
      );

  // bold style
  static TextStyle getBoldStyle({double? fontSize, Color? color}) =>
     _getTextStyle(
      fontSize ?? FontSize.s26,
      FontWeightManager.bold,
      color ?? AppColors.black,
    );


  // semibold style
  static TextStyle getSemiBoldStyle({double? fontSize, Color? color}) =>
     _getTextStyle(
      fontSize ?? FontSize.s20,
      FontWeightManager.semiBold,
      color ?? AppColors.black,
    );

}
