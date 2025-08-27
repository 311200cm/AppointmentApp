import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/strings.dart';
import '../../../../core/theming/app_styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi ${userName}!",
            style: TextStyles.font18DarkBlackBold,
            ),
            //SizedBox(height: 10.h,),
            Text("How Are you Today?",
            style: TextStyles.font11moreLightGrayRegular,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.moreLighterGray,
          child: SvgPicture.asset(homeNotificationIcon),
        )
      ],
    );
  }
}
