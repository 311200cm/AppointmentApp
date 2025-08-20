import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../core/networking/api_error_handler.dart';
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
}
