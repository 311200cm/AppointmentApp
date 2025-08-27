import 'package:appointment_app/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/strings.dart';
import '../../../../core/theming/app_styles.dart';

class DoctorListViewItem extends StatelessWidget {
  DoctorModel? doctorModel;
   DoctorListViewItem({super.key,required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      child:Row(
        children: [
          Image.asset(homeDoctorList,
            height: 100,
            width: 100,
            //fit: BoxFit.cover,
          ),
          SizedBox(width: 15.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctorModel?.name??"Name",
                  style: TextStyles.font18DarkBlackBold,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h,),
                Text(doctorModel?.email??"email123@gmail.com",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font14LighterGrayMedium,
                ),
                SizedBox(height: 12.h,),
                Text( '${doctorModel?.degree} | ${doctorModel?.phone}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font14LighterGrayMedium,
                )
              ],
            ),
          )
        ],
      ) ,
    );
  }
}
