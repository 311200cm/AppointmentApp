import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse{
  String? message;
  UserData? data;
  int? code;
  bool? status;

  LoginResponse({
     this.message,
     this.code,
     this.data,
     this.status
});
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
@JsonSerializable()
class UserData{
  String? token;
  //TODO:استخدمت jsonkey لان اسم key فى postman هو username وانا مسمياه عندى userNameفعلشان يعرف انوا اقصد بيه key اللى هناك فيحط فيه قيمه value الموجوده فى username فى postman
  @JsonKey(name:"username")
  String? userName;

  UserData({required this.token,required this.userName});
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}