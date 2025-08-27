import 'package:json_annotation/json_annotation.dart';
part 'specialization_response_model.g.dart';
@JsonSerializable()
class SpecializationResponseModel{
  int ? code;
  @JsonKey(name:"data")
  List<SpecializationData>?specializationData;

  SpecializationResponseModel(this.specializationData,this.code);
  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) => _$SpecializationResponseModelFromJson(json);
}
@JsonSerializable()
class SpecializationData{
  int? id;
  @JsonKey(name:"name")
  String? specializationName;
  List<DoctorModel>? doctors;
  SpecializationData(this.id,this.doctors,this.specializationName);
  factory SpecializationData.fromJson(Map<String, dynamic> json) => _$SpecializationDataFromJson(json);
}
@JsonSerializable()
class DoctorModel{
  String? name;
  String? email;
  String? phone;
  String? degree;
  @JsonKey(name:"appoint_price")
  int? appointPrice;

  DoctorModel(this.phone,this.name,this.email,this.appointPrice,this.degree);
  factory DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);
}