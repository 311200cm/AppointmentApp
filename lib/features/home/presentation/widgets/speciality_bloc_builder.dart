import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:appointment_app/features/home/logic/home_cubit.dart';
import 'package:appointment_app/features/home/presentation/widgets/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_styles.dart';
import 'doctor_list_view.dart';
import 'doctor_speciality_list_view.dart';
import 'doctors_shimmer_loading.dart';

class SpecialityBlocBuilder extends StatelessWidget {
  const SpecialityBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      buildWhen: (previous,current)=>
        current is SpecializationHomeLoading||
        current is SpecializationHomeWithError||
        current is SpecializationHomeWithSuccessfully,
        builder: (context,state){
          if(state is SpecializationHomeLoading){
            return Expanded(
              child: Column(
                children: [
                  const SpecialityShimmerLoading(),
                  SizedBox(height: 8.h,),
                  const DoctorsShimmerLoading(),
                ],
              ),
            );;
            // return SizedBox(
            //   height: 100.h,
            //   child: Center(
            //     child: CircularProgressIndicator(
            //       color: AppColors.mainBlue,
            //     ),
            //   ),
            // );
          }
          else if(state is SpecializationHomeWithError){
            return SizedBox(
              height: 100.h,
              child: Center(
                child: Text(state.errorHandler.getAllMessagesError(),
                style: TextStyles.font24MainBlueBold,
                )
              ),
            );
          }
          else if(state is SpecializationHomeWithSuccessfully){
            return DoctorSpecialityListView(specializationResponseModel: state.specializationResponseModel,);
          }
          else{
            return Center(
              child: Text("Error!!!!!",
              style: TextStyles.font18DarkBlackSemiBold,
              ),
            );
          }
        }
    );
  }
}
