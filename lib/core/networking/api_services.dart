
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/login/data/models/login_request_body.dart';
import '../../features/auth/login/data/models/login_response.dart';
import '../../features/auth/sign_up/data/models/sign_up_request_body.dart';
import '../../features/auth/sign_up/data/models/sign_up_response.dart';
import 'api_constants.dart';
part 'api_services.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl )

abstract class ApiServices{
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;
@POST(ApiConstants.login)
//TODO:apiRequestBody i will send it when call this function in repo
  Future<LoginResponse>postLogin(@Body() LoginRequestBody loginRequestBody);

@POST(ApiConstants.signUp)

  Future<SignupResponse>postSignup(@Body() SignupRequestBody signupRequestBody);
}