import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';


class SignUpListener extends StatelessWidget {
  const SignUpListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit,SignUpState>(
        listener:(context,state){
          if(state is SignupLoading){
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainBlue,
                ),
              ),
            );
          }
          else if(state is SignupSuccessfully){
            //TODO:context.pop() to exit from showDialog
            showSuccessDialog(context);
          }
          else if (state is SignupWithError){
            setupErrorState(context,state.errorHandler.getAllMessagesError());
          }
        },
        child:SizedBox.shrink()
    );
  }
  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
              ),
              onPressed: () {
                context.pushNamed(Routes.homeScreen);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }
  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14MainBlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
