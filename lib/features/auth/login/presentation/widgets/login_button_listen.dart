import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../auth_cubit/auth_cubit.dart';



class LoginButtonListen extends StatelessWidget {
  const LoginButtonListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthState>(
        listener:(context,state){
      if(state is LoginLoading){
        showDialog(
          context: context,
          builder: (context) => Center(
            child: CircularProgressIndicator(
              color: AppColors.mainBlue,
            ),
          ),
        );
      }
      else if(state is LoginSuccessfully){
        //TODO:context.pop() to exit from showDialog
        context.pop();
        context.pushNamed(Routes.homeScreen);
      }
      else if (state is LoginWithError){
        setupErrorState(context,state.error.apiErrorModel.message!);
      }
    },
    child:SizedBox.shrink()
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
          style: TextStyles.font15BoldBlueMedium,
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


