import 'package:appointment_app/core/networking/api_error_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../login/data/models/login_request_body.dart';
import '../login/data/models/login_response.dart';
import '../login/data/repos/login_repo.dart';
import '../sign_up/data/models/sign_up_request_body.dart';
import '../sign_up/data/models/sign_up_response.dart';
import '../sign_up/data/repo/sign_up_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
 final LoginRepo loginRepo;
 final SignupRepo signupRepo;
  AuthCubit( this.loginRepo,this.signupRepo) : super(AuthInitial());

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  GlobalKey <FormState>formKey=GlobalKey<FormState>();
  LoginResponse? loginResponse;

//TODO:login function
  void login(LoginRequestBody loginRequestBody)async{
    emit(LoginLoading());
    try{
      loginResponse=await loginRepo.login(loginRequestBody);
      if(loginResponse!.code==200){
        emit(LoginSuccessfully(loginResponse: loginResponse!));
      }
      else{
        print("Error from cubit ${loginResponse!.message}");
        emit(LoginWithError(error: ErrorHandler.handle(loginResponse)));
      }
    }catch(error){
      print("Error from cubit $error");
      emit(LoginWithError(error: ErrorHandler.handle(error)));
    }
  }

  //TODO: signup Function
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void signUp() async {
    emit(SignupLoading());
    try {
      SignupResponse signupResponse = await signupRepo.signUp(
        SignupRequestBody(
          password: password.text,
          email: email.text,
          name: name.text,
          phone: phone.text,
          gender: 0,
          passwordConfirmation: confirmPassword.text,
        ),
      );
      if(signupResponse.code==200){
        emit(SignupSuccessfully(signupResponse: signupResponse));
      }
      else{
        emit(SignupWithError(errorHandler:  ErrorHandler.handle(signupResponse)));
      }
    } catch (error) {
      print("error from repo $error");
      emit(SignupWithError(errorHandler: ErrorHandler.handle(error)));
    }
  }
}
