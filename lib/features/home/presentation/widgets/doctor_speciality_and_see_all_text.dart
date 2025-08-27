import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

class DoctorSpecialityAndSeeAllText extends StatelessWidget {
  const DoctorSpecialityAndSeeAllText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       Text("Doctor Speciality",
       style: TextStyles.font18DarkBlackSemiBold,
       ),
       Spacer(),
       Text("See All",
       style: TextStyles.font12MainBlueRegular,
       )
     ],
    );
  }
}
