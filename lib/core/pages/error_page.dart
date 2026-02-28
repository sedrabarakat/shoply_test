import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_text_styles.dart';

class ErrorPage extends StatelessWidget {
  String message;

  ErrorPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: Center(
        child: Text(
          message,
          style: AppTextStyles.getMediumStyle(),
          maxLines: 5,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
