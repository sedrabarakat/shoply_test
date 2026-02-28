import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';

PreferredSizeWidget shopsAppbar(){
  return AppBar(
    actionsPadding: EdgeInsets.symmetric(horizontal: 20.w),
    leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),

    actions: [
      CircleAvatar(
        radius: 20.r,
        backgroundColor: Colors.white,
        child: Image.asset(AppAssets.user),
      ),
    ],
  );
}