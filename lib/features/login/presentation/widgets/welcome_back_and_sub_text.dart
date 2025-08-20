import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';


class WelcomeBackAndSubText extends StatelessWidget {
  const WelcomeBackAndSubText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome Back",
        style: TextStyles.font24MainBlueBold,
        ),
        SizedBox(height: 30.h,),
        Text("We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
        style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
