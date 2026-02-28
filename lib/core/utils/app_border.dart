import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class AppBorder {

  static OutlineInputBorder fieldDefault(){
    return  OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: 1),
      borderRadius: BorderRadius.circular(12.r),
    );
  }

  static OutlineInputBorder focusedDefault(){
    return  OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primary, width: 1.5),
    borderRadius: BorderRadius.circular(15.r),
    );
  }
}