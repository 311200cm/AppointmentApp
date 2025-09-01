part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

//Specialization
class SpecializationHomeLoading extends HomeState{}
class SpecializationHomeWithError extends HomeState{

  ApiErrorModel errorHandler;
  SpecializationHomeWithError({required this.errorHandler});
}

class SpecializationHomeWithSuccessfully extends HomeState{

  SpecializationResponseModel specializationResponseModel;

  SpecializationHomeWithSuccessfully({required this.specializationResponseModel});
}

//Doctor
//TODO:we dont need loading state because we not call end point
class GetDoctorsListWithError extends HomeState{

  ApiErrorModel error;
  GetDoctorsListWithError({required this.error});
}

class GetDoctorsListSuccessfully extends HomeState{
  List<DoctorModel>doctors;
  GetDoctorsListSuccessfully({required this.doctors});
}
