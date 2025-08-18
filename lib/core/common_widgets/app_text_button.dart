import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final double? horizontalPadding;
  final double?verticalPadding;
  final double? borderRadius;
  const AppTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textStyle,
    this.width,
    this.height, 
    this.horizontalPadding, 
    this.verticalPadding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      child: Text(text, style: textStyle ?? TextStyles.font16WhiteSemiBold),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? AppColors.mainBlue,
        ),
        fixedSize: WidgetStateProperty.all(
          Size(width?.w ?? double.maxFinite, height?.h ?? 50.h),
        ),
        padding:  WidgetStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(
    horizontal: horizontalPadding?.w ?? 12.w,
    vertical: verticalPadding?.h ?? 14.h,
    ),
      ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
      )
    );
  }
}
