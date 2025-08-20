import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../core/networking/api_error_handler.dart';
import '../data/models/sign_up_request_body.dart';
import '../data/models/sign_up_response.dart';
import '../data/repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupRepo signupRepo;
  SignUpCubit(this.signupRepo) : super(SignUpInitial());

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
