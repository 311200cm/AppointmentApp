import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermAndConditionText extends StatelessWidget {
  const TermAndConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "By logging, you agree to our",
              style: TextStyles.font11LightGrayRegular
            ),
            TextSpan(
                text: "  Terms & Conditions",
                style: TextStyles.font11BlackMedium
            ),
            TextSpan(
                text: "  and",
                style: TextStyles.font11LightGrayRegular.copyWith(height: 1.5.h),
            ),
            TextSpan(
                text: " PrivacyPolicy.",
                style: TextStyles.font11BlackMedium.copyWith(height: 1.5.h)
            ),
          ]
        )
    );
  }
}
