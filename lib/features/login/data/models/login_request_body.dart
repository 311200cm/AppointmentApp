import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';
@JsonSerializable()
//TODO: model to data send to end point
class LoginRequestBody{
  String email;
  String password;
  LoginRequestBody({required this.password,required this.email});
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}