import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:appointment_app/features/home/presentation/widgets/doc_doc_blue_container.dart';
import 'package:appointment_app/features/home/presentation/widgets/doctor_list_view.dart';
import 'package:appointment_app/features/home/presentation/widgets/doctor_speciality_and_see_all_text.dart';
import 'package:appointment_app/features/home/presentation/widgets/doctors_bloc_builder.dart';
import 'package:appointment_app/features/home/presentation/widgets/speciality_bloc_builder.dart';
import 'package:appointment_app/features/home/presentation/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doctor_speciality_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //TODO:we use container to take all width and column take all height by default
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16.h,horizontal: 15.w),
              width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeTopBar(),
                SizedBox(height: 20.h,),
                DocDocBlueContainer(),
                SizedBox(height: 8.h,),
                DoctorSpecialityAndSeeAllText(),
                SizedBox(height: 10.h,),
                //HomeBlocBuilder()
                SpecialityBlocBuilder(),
                SizedBox(height: 20.h,),
                DoctorsBlocBuilder(),
              ],
            ),
          ),
      ),
    );
  }
}
