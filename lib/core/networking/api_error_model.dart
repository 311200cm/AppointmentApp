import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  String? message;
  int? code;
  @JsonKey(name: "data")
  dynamic ?errorMap;

  ApiErrorModel({
     this.message,
     this.code,
     this.errorMap,
  });
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  String getAllMessagesError(){
    if( errorMap ==null || errorMap!.isEmpty ){
      return message ??" Unknown error occur";
    }
    else{
      //TODO: convert map to string contain all error messages to show it in ui
      //TODO: entries are all index in map
      //TODO: element is each index in map(key&& value)
     final errorMessages= errorMap!.entries.map((element){
       final value=element.value;
       return "${value.join(" , ")}";
     }).join("\n");
      return errorMessages;
    }
  }
}

