
import 'package:appointment_app/features/auth/sign_up/presentation/widgets/already_have_account_text.dart';
import 'package:appointment_app/features/auth/sign_up/presentation/widgets/create_account_and_sub_text.dart';
import 'package:appointment_app/features/auth/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:appointment_app/features/auth/sign_up/presentation/widgets/sign_up_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/app_text_button.dart';
import '../../../../core/common_widgets/term_and_condition_text.dart';
import '../../auth_cubit/auth_cubit.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                CreateAccountAndSubText(),
                SizedBox(height: 30.h),
                Column(
                  children: [
                    SignUpForm(),
                    //SizedBox(height: 15),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Text(
                    //     "Forgot Password?",
                    //     style: TextStyles.font14MainBlueRegular,
                    //   ),
                    // ),
                    SizedBox(height: 30.h),
                    AppTextButton(
                      text: "Create Account",
                      onPressed: () {
                        if(context.read<AuthCubit>().key.currentState!.validate()){
                          context.read<AuthCubit>().signUp();
                        }
                      },
                    ),

                    SizedBox(height: 30.h),
                    TermAndConditionText(),
                    SizedBox(height: 20.h),
                    AlreadyHaveAccountText(),
                    SignUpListener(),
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
