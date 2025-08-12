import 'package:appointment_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/routes.dart';

class DocDocApp extends StatelessWidget {
  const DocDocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        initialRoute: Routes.onboardingScreen,
        onGenerateRoute: AppRouter().generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

