import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';


class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: [
              TextSpan(
                  text: "Already have account?",
                  style: TextStyles.font14BoldBlackRegular
              ),
              TextSpan(
                  recognizer:TapGestureRecognizer()
                    ..onTap=(){
                      context.pushNamed(Routes.loginScreen);
                    },
                  text: "Login",
                  style: TextStyles.font14MainBlueSemiBold
              ),
            ]
        )
    );
  }
}
