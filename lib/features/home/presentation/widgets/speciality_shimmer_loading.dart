import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/strings.dart';

class SpecialityShimmerLoading extends StatelessWidget {
  const SpecialityShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:10,
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
              child: Container(
                child: Column(
                 children: [
                   Shimmer.fromColors(
                       child: CircleAvatar(
                         radius: 28,
                         backgroundColor: AppColors.moreLightBlue,
                         child: SvgPicture.asset(
                           generalSpeciality,
                           height: 42.h,
                           width: 42.w,
                           fit: BoxFit.cover,
                         ),
                       ),
                       baseColor: AppColors.gray,
                       highlightColor: AppColors.white
                   ),
                   SizedBox(height: 14.h),
                   Shimmer.fromColors(
                       child: Container(
                            height: 14.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(12),
                            ),
                       ),
                       baseColor:  AppColors.gray,
                       highlightColor: AppColors.white
                   )
                 ],
                ),
              ),
            );
          }
      ),
    );;
  }
}
