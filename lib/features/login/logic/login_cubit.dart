import 'package:appointment_app/core/helpers/shared_preferences_helper.dart';
import 'package:appointment_app/core/helpers/shared_preferences_keys.dart';
import 'package:appointment_app/core/helpers/strings.dart';
import 'package:appointment_app/core/networking/api_error_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../core/networking/api_error_handler.dart';
import '../../../core/networking/dio.dart';
import '../data/models/login_request_body.dart';
import '../data/models/login_response.dart';
import '../data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

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
       await SharedPreferencesHelper.setSecuredString(SharedPreferencesKeys.userToke, loginResponse!.data?.token??" ");
       DioFactory.getTokenAfterLoginOrSignUp(loginResponse!.data?.token??" ");
       userName=loginResponse?.data!.userName??" ";
        emit(LoginSuccessfully(loginResponse: loginResponse!));
      }
      else{
        print("Error from response ${loginResponse!.message}");
        emit(LoginWithError(error: ApiErrorHandler.handle(loginResponse)));
      }
    }catch(error){
      print("Error from cubit ${error}");
      emit(LoginWithError(error: ApiErrorHandler.handle(error)));
    }
  }
}
