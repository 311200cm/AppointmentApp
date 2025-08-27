import 'package:appointment_app/core/helpers/strings.dart';
import 'package:appointment_app/features/home/data/models/specialization_response_model.dart';
import 'package:appointment_app/features/home/logic/home_cubit.dart';
import 'package:appointment_app/features/home/presentation/widgets/doctor_speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class DoctorSpecialityListView extends StatefulWidget {
  SpecializationResponseModel specializationResponseModel;
   DoctorSpecialityListView({super.key,required this.specializationResponseModel});

  @override
  State<DoctorSpecialityListView> createState() => _DoctorSpecialityListViewState();
}

class _DoctorSpecialityListViewState extends State<DoctorSpecialityListView> {
  int selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationResponseModel.specializationData!.length,
          itemBuilder: (context,index){
             return GestureDetector(
               onTap: (){
                 setState(() {
                   selectedIndex= index;
                 });
                 context.read<HomeCubit>().getDoctorList(specializationId: widget.specializationResponseModel.specializationData![index].id);
               },
                 child: DoctorSpecialityListViewItem(
                     specializationData: widget.specializationResponseModel.specializationData![index],
                     index: index,
                     selectedIndex:selectedIndex, ),
             );
          }
      ),
    );
  }
}
