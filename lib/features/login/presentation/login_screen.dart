import 'package:appointment_app/core/common_widgets/app_text_button.dart';
import 'package:appointment_app/core/common_widgets/app_text_form_field.dart';
import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:appointment_app/features/login/logic/login_cubit.dart';
import 'package:appointment_app/features/login/presentation/widgets/dont_have_account_text.dart';
import 'package:appointment_app/features/login/presentation/widgets/email_and_password.dart';
import 'package:appointment_app/features/login/presentation/widgets/login_button_listen.dart';
import 'package:appointment_app/features/login/presentation/widgets/welcome_back_and_sub_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/term_and_condition_text.dart';
import '../data/models/login_request_body.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeBackAndSubText(),
                SizedBox(height: 30.h),
                Column(
                  children: [
                    EmailAndPassword(),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.font14MainBlueRegular,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    AppTextButton(
                        text: "Login",
                        onPressed: () {
                          if (context
                              .read<LoginCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context.read<LoginCubit>().login(
                              LoginRequestBody(
                                password: context
                                    .read<LoginCubit>()
                                    .passwordController
                                    .text,
                                email: context
                                    .read<LoginCubit>()
                                    .emailController
                                    .text,
                              ),
                            );
                          }
                        },
                      ),

                    SizedBox(height: 30.h),
                    TermAndConditionText(),
                    SizedBox(height: 50.h),
                    DontHaveAccountText(),
                    LoginButtonListen(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
