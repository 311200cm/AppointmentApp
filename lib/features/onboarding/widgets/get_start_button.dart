import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';

class GetStartButton extends StatelessWidget {
  const GetStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      context.pushNamed(Routes.loginScreen);
    }, child: Text("Get Started",
      style: TextStyles.font16WhiteSemiBold,
    ),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.mainBlue),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        )),
        minimumSize: WidgetStateProperty.all(Size(350, 52))
      ),
    );
  }
}
