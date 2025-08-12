import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:appointment_app/features/onboarding/widgets/doc_icon_and_name.dart';
import 'package:appointment_app/features/onboarding/widgets/get_start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/image_doctor_and_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top: 30.h,bottom: 60.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DocIconAndName(),
                SizedBox(height: 30.h,),
                ImageDoctorAndText(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text("Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                  style: TextStyles.font13GrayRegular,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 15.h,),
                GetStartButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
