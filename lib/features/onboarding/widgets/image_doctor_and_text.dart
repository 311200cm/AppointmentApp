import 'package:appointment_app/core/helpers/strings.dart';
import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageDoctorAndText extends StatelessWidget {
  const ImageDoctorAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(onboardingBackGround),
        //TODO:حطيت container علشان هو اللى هيساعدنى اعمل الشادو اللى فى اخر الصوره
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Colors.white,
                  Colors.white.withOpacity(0.0)
                ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              //TODO:عدد خانات stop هو عدد خانات الالوان الرقم الاول بيعبر اللون الاول هيوقف امتى والرقم التانى بيعبر اللون التانى هيوقف امتى
              stops: [0.14,0.8],
            )
          ),
          child:  Image.asset(onboardingDoctor,
            fit: BoxFit.cover,

          ),
        ),
      Positioned(
        bottom: 30,
        left: 0,
        right: 0,
        child: Text("Best Doctor\n Appointment App",
        style: TextStyles.font32MainBlueBold,
          textAlign: TextAlign.center,
        ),
      )
      ],
    );
  }
}
