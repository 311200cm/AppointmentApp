import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final TextStyle? hintStyle;
  final String hintText;
  final bool? obscureText;
  final InputBorder? enableBorder;
  final InputBorder? focusedBorder;
  final Widget? suffixIcon;
  final double? widthPadding;
  final double? hightPadding;
  final Function(String?) validator;
  final TextEditingController? controller;
  const AppTextFormField({
    super.key,
    this.hintStyle,
    required this.hintText,
    this.obscureText,
    this.enableBorder,
    this.focusedBorder,
    this.suffixIcon,
    this.widthPadding,
    this.hightPadding,
    required this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextFormField(
        controller: controller,
        validator:(value){
          return validator(value);
        },
        decoration: InputDecoration(
          hintStyle: hintStyle ?? TextStyles.font14LighterGrayMedium,
          hintText: hintText,
          enabledBorder:
              enableBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: AppColors.lighterGray,
                  width: 1.5.w,
                ),
              ),
          focusedBorder:
              focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.mainBlue, width: 1.5.w),
              ),
          errorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.red, width: 1.5.w),
          ),
          isDense: true,
          filled: true,
          fillColor: AppColors.lighterWhite,
          suffixIcon: suffixIcon ?? SizedBox(),
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: widthPadding?.w ?? 20.w,
            vertical: hightPadding?.h ?? 18.h,
          ),
        ),
        obscureText: obscureText ?? false,
        style: TextStyles.font16BoldBlackRegular,
      ),
    );
  }
}
