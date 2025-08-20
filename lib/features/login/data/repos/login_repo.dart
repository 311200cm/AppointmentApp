import 'package:appointment_app/core/networking/api_services.dart';

import 'package:dio/dio.dart';

import '../models/login_request_body.dart';
import '../models/login_response.dart';

class LoginRepo{
  final ApiServices apiServices;
  LoginRepo(this.apiServices);

  Future<LoginResponse>login(LoginRequestBody loginRequestBody)async{
    // LoginResponse response=LoginResponse();
    // try{
    //    response=await apiServices.get(loginRequestBody);
    //     return response;
    //
    // }catch(error){
    //   print("Error from repo $error");
    //   print("value of response from repo ${response.message } , ${response.code }");
    //   return response ;
    // }
 return await apiServices.postLogin(loginRequestBody);
  }
}