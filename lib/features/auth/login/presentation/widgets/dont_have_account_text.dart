import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';


class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Do net have account?",
              style: TextStyles.font14BoldBlackRegular
            ),
            TextSpan(
              recognizer:TapGestureRecognizer()
                ..onTap=(){
                context.pushNamed(Routes.signupScreen);
            },
                text: "Sign Up",
                style: TextStyles.font14MainBlueSemiBold
            ),
          ]
        )
    );
  }
}
