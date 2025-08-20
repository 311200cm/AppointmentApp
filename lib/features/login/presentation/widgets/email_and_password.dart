import 'package:appointment_app/core/helpers/app_regex.dart';
import 'package:appointment_app/features/login/logic/login_cubit.dart';
import 'package:appointment_app/features/login/presentation/widgets/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common_widgets/app_text_form_field.dart';




class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey form;
  bool isObscure=true;

  bool hasLowerCase=false;
  bool hasUpperCase=false;
  bool hasNumber=false;
  bool hasSpecialCharacter=false;
  bool hasMinLength=false;

  void initState(){
    super.initState();
    email= context.read<LoginCubit>().emailController;
    password= context.read<LoginCubit>().passwordController;
    form= context.read<LoginCubit>().formKey;

    setUpPasswordValidator();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        children: [
          AppTextFormField(hintText: "Email",
            controller: email,
            validator: (value){
            if(value!.isEmpty || ! AppRegex.isEmailValid(value) || value == null){
              return "Please enter valid email";
            }
            },
          ),
          SizedBox(height: 30.h),
          AppTextFormField(
            controller: password,
            validator: (value){
              if(value!.isEmpty ||value == null
              ||!hasMinLength || !hasSpecialCharacter || !hasNumber ||!hasLowerCase ||!hasUpperCase){
                return "Please enter valid password";
              }
            },
            hintText: "Password",
            suffixIcon: GestureDetector(
              onTap: () {
                isObscure = !isObscure;
                setState(() {});
              },
              child: Icon(
                isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            obscureText: isObscure,
          ),
         SizedBox(height: 30.h,),
          PasswordValidator(
            hasLowerCase: hasLowerCase,
            hasMinLength: hasMinLength,
            hasNumber: hasNumber,
            hasSpecialCharacter: hasSpecialCharacter,
            hasUpperCase: hasUpperCase,
          )
        ],
      ),
    );
  }
  void setUpPasswordValidator(){
    //TODO:addListener is function listen change in controller
    password.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(password.text);
        hasNumber = AppRegex.hasNumber(password.text);
        hasUpperCase = AppRegex.hasUpperCase(password.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(password.text);
        hasMinLength = AppRegex.hasMinLength(password.text);
      });
    }
    );
  }
}
