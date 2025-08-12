import 'dart:ui';

import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles{
  static TextStyle font24BlackBold=TextStyle(
    //TODO:sp تستخدم بسبب screenutill علشان تناسب احجام كل الاسكرين
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );
  static TextStyle font32MainBlue700Weight=TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlue
  );
static TextStyle font13GrayRegular=TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  color: AppColors.gray
);
  static TextStyle font16WhiteSemiBold=TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.white
  );
}