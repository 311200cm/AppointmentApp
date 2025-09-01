import 'package:appointment_app/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import 'doctor_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
        buildWhen: (previous,current)=>
        current is GetDoctorsListWithError||
            current is GetDoctorsListSuccessfully,
        builder: (context,state){
          if(state is GetDoctorsListSuccessfully){
            return DoctorListView(doctors: state.doctors);
          }
          else if(state is GetDoctorsListWithError){
            return SizedBox(
              height: 100.h,
              child: Center(
                  child: Text(state.error.getAllMessagesError(),
                    style: TextStyles.font24MainBlueBold,
                  )
              ),
            );
          }
          // else if(state is SpecializationHomeLoading){
          //   return  const SizedBox.shrink();
          // }
          else{
            return const SizedBox.shrink();
          }
        }
    );
  }
}
