
import 'package:appointment_app/features/auth/sign_up/presentation/widgets/password_and_confirm_password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common_widgets/app_text_form_field.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../auth_cubit/auth_cubit.dart';



class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController name;
  late TextEditingController confirmPassword;
  late TextEditingController phone;
  late GlobalKey form;
  bool isObscurePassword=true;
  bool isObscureConfirmPassword=true;

  bool hasLowerCase=false;
  bool hasUpperCase=false;
  bool hasNumber=false;
  bool hasSpecialCharacter=false;
  bool hasMinLength=false;
  void initState(){
    super.initState();
    email= context.read<AuthCubit>().email;
    password= context.read<AuthCubit>().password;
    name= context.read<AuthCubit>().name;
    confirmPassword= context.read<AuthCubit>().confirmPassword;
    phone= context.read<AuthCubit>().phone;
    form= context.read<AuthCubit>().key;

    setUpPasswordValidator();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        children: [
          AppTextFormField(hintText: "Name",
            controller: name,
            validator: (value){
              if(value!.isEmpty  || value == null){
                return "Please enter valid name";
              }
            },
          ),
          SizedBox(height: 30.h),
          AppTextFormField(hintText: "Email",
            controller: email,
            validator: (value){
              if(value!.isEmpty || ! AppRegex.isEmailValid(value) || value == null){
                return "Please enter valid email";
              }
            },
          ),
          SizedBox(height: 30.h),
          AppTextFormField(hintText: "Phone",
            controller: phone,
            validator: (value){
              if(value!.isEmpty  || value == null){
                return "Please enter valid phone";
              }
              else if(! AppRegex.isPhoneNumberValid(value)){
                return "Phone number must be 11 digits";
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
                isObscurePassword = !isObscurePassword;
                setState(() {});
              },
              child: Icon(
                isObscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            obscureText: isObscurePassword,
          ),
          SizedBox(height: 30.h,),
          AppTextFormField(
            controller: confirmPassword,
            validator: (value){
              if(value!.isEmpty ||value == null){
                return "Please enter valid confirm password";
              }
              else if(value != password.text){
                return "No match with password value";
              }
            },
            hintText: "Confirm Password",
            suffixIcon: GestureDetector(
              onTap: () {
                isObscureConfirmPassword = !isObscureConfirmPassword;
                setState(() {});
              },
              child: Icon(
                isObscureConfirmPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            obscureText: isObscureConfirmPassword,
          ),
          SizedBox(height: 30.h),
          PasswordAndConfirmPasswordValidation(
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
