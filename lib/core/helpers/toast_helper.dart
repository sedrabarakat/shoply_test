import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ToastHelper {
  ToastHelper._internal();

  static final ToastHelper _instance = ToastHelper._internal();

  factory ToastHelper() {
    return _instance;
  }

  static showNotificationToast( {required String msg, String? subtitle}) {
    return BotToast.showNotification(
      duration: const Duration(seconds: 1200),
      backgroundColor: AppColors.blackBackground, //primary
      margin: EdgeInsets.all(20.w),
      contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
      borderRadius: 15.r,
      title: (_) => Text(
        msg,
        style: AppTextStyles.getMediumStyle(color: CupertinoColors.white),
      ),
      subtitle: subtitle != null
          ? (_) => Text(
        subtitle,
        style: AppTextStyles.getMediumStyle(color: AppColors.lightFont),
      )
          : null,
      leading: (_) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: CircleAvatar(
            backgroundColor: Colors.black38,
            child: Icon(CupertinoIcons.mail,color: AppColors.white,),
          )
      ),
    );
  }



}