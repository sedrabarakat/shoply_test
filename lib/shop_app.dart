import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/routes_config.dart';
import 'core/theme/theme.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: Builder(
            builder: (context) {
              return MaterialApp.router(
                builder: BotToastInit(),
                theme:   AppTheme.lightTheme(),
                debugShowCheckedModeBanner: false,
                title: 'Shop app',
                routerConfig: AppRoutes.configs,
              );
            }));
  }
}
