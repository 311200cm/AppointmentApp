import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';
@JsonSerializable()
class SignupRequestBody {
  String? name;
  String? email;
  String? password;
  String? phone;
  int? gender;
  //TODO:we use JsonKey because key in api is different of key in model
  @JsonKey(name: "password_confirmation")
  String? passwordConfirmation;

  SignupRequestBody({
    required this.password,
    required this.email,
    required this.name,
    required this.phone,
    required this.gender,
    required this.passwordConfirmation,
  });
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
