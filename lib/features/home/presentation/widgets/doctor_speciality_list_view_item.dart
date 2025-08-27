import 'package:appointment_app/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/strings.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final SpecializationData? specializationData;
  final int index;
  final int selectedIndex;
  const DoctorSpecialityListViewItem({
    super.key,
    required this.specializationData,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
      child: Column(
        children: [
          selectedIndex==index ?
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.darkBlack,
                width: 1.5
              ),
              shape: BoxShape.circle
            ),
            child:CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.moreLightBlue,
              child: SvgPicture.asset(
                generalSpeciality,
                height: 42.h,
                width: 42.w,
                fit: BoxFit.cover,
              ),
            ),
          ):
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.moreLightBlue,
            child: SvgPicture.asset(
              generalSpeciality,
              height: 40.h,
              width: 40.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            specializationData?.specializationName ?? "Name",
            style:selectedIndex==index?TextStyles.font14DarkBlackBold:
            TextStyles.font12DarkBlackRegular,
          ),
        ],
      ),
    );
  }
}
