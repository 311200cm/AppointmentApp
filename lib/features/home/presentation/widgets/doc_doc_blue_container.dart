import 'package:appointment_app/core/helpers/strings.dart';
import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_styles.dart';

class DocDocBlueContainer extends StatelessWidget {
  const DocDocBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO:we use sizedbox to take space to stack to prevent clip of image
    return SizedBox(
      height: 197.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 167.h,
            padding: EdgeInsets.fromLTRB(20.w, 15.h, 0, 0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              //TODO: استخدمنا الصوره بدل ما اعمل لون بال color علشان الباترن فيه تدرجات الوان مش لون واحد
              image: DecorationImage(image: AssetImage(homePattern,),
              fit: BoxFit.cover,
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Book and\nschedule with\nnearest doctor",
                style: TextStyles.font18WhiteMedium,
                ),
                SizedBox(height: 20.h,),
                ElevatedButton(
                    onPressed: (){}, 
                    child: Text("Find Nearby",
                    style: TextStyles.font12MainBlueRegular,
                    ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.white),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48)
                    ))
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 8.w,
              bottom: 30.h,
              child: Image.asset(homeDoctorPattern,
              height: 200.h,
              )
          )
        ],
      ),
    );
  }
}
