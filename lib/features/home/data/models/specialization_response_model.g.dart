// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationResponseModel _$SpecializationResponseModelFromJson(
  Map<String, dynamic> json,
) => SpecializationResponseModel(
  (json['data'] as List<dynamic>?)
      ?.map((e) => SpecializationData.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$SpecializationResponseModelToJson(
  SpecializationResponseModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.specializationData,
};

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) =>
    SpecializationData(
      (json['id'] as num?)?.toInt(),
      (json['doctors'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['name'] as String?,
    );

Map<String, dynamic> _$SpecializationDataToJson(SpecializationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.specializationName,
      'doctors': instance.doctors,
    };

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
  json['phone'] as String?,
  json['name'] as String?,
  json['email'] as String?,
  (json['appoint_price'] as num?)?.toInt(),
  json['degree'] as String?,
);

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'degree': instance.degree,
      'appoint_price': instance.appointPrice,
    };
