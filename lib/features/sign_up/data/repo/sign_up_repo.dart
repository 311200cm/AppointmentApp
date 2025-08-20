import 'package:appointment_app/core/networking/api_services.dart';

import '../models/sign_up_request_body.dart';
import '../models/sign_up_response.dart';


class SignupRepo{
  final ApiServices apiServices;
SignupRepo(this.apiServices);

Future<SignupResponse>signUp(SignupRequestBody signupRequestBody)async{
   return await apiServices.postSignup(signupRequestBody);
}
}