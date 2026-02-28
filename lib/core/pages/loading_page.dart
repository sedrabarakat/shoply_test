import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class LoadingPage extends StatelessWidget{
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: Center(
        child: CircularProgressIndicator(color: AppColors.primary,)
      ),
    );
  }

}

