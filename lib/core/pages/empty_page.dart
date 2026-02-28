import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class EmptyPage extends StatelessWidget {
  String emptyMessage;

  EmptyPage({super.key, required this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: Center(
        child: Text(
          emptyMessage,
          style: AppTextStyles.getMediumStyle(color: AppColors.black),
        ),
      ),
    );
  }
}
