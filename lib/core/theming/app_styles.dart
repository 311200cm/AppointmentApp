import 'dart:ui';

import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:appointment_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles{
  static TextStyle font24BlackBold=TextStyle(
    //TODO:sp تستخدم بسبب screenutill علشان تناسب احجام كل الاسكرين
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black
  );
  static TextStyle font24MainBlueBold=TextStyle(
    //TODO:sp تستخدم بسبب screenutill علشان تناسب احجام كل الاسكرين
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold,
      color: AppColors.mainBlue
  );
  static TextStyle font14GrayRegular=TextStyle(
    //TODO:sp تستخدم بسبب screenutill علشان تناسب احجام كل الاسكرين
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.gray
  );
  static TextStyle font14LighterGrayMedium=TextStyle(
    //TODO:sp تستخدم بسبب screenutill علشان تناسب احجام كل الاسكرين
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      color: AppColors.lighterGray
  );
  static TextStyle font32MainBlueBold=TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.mainBlue
  );
  static TextStyle font14MainBlueRegular=TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.mainBlue
  );
static TextStyle font13GrayRegular=TextStyle(
  fontSize: 13.sp,
  fontWeight: FontWeightHelper.regular,
  color: AppColors.gray
);
  static TextStyle font11BlackMedium=TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeightHelper.medium,
      color: Colors.black
  );
  static TextStyle font14BoldBlackRegular=TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.boldBlack
  );
  static TextStyle font14MainBlueSemiBold=TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: AppColors.mainBlue
  );
  static TextStyle font11LightGrayRegular=TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.lightGray
  );
  static TextStyle font16BoldBlackRegular=TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.boldBlack
  );
  static TextStyle font16WhiteSemiBold=TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: AppColors.white
  );
  static TextStyle font15BoldBlueMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.boldBlack,
  );
}