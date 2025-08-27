import 'package:appointment_app/core/networking/api_services.dart';
import 'package:appointment_app/features/home/data/models/specialization_response_model.dart';

class HomeRepo{
  final ApiServices apiServices;
  HomeRepo(this.apiServices);
  Future<SpecializationResponseModel>getSpecialization()async{
    return await apiServices.getSpecialization();
  }
}