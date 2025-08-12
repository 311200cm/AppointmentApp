import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/strings.dart';

class DocIconAndName extends StatelessWidget {
  const DocIconAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(docDocIcon),
        SizedBox(width: 10.w,),
        Text("Docdoc",
        style: TextStyles.font24BlackBold,
        )
      ],
    );
  }
}
