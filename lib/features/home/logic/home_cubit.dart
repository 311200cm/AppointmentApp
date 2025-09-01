import 'package:appointment_app/core/networking/api_error_handler.dart';
import 'package:appointment_app/core/networking/api_error_model.dart';
import 'package:appointment_app/features/home/data/models/specialization_response_model.dart';
import 'package:appointment_app/features/home/data/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  List<SpecializationData?>?specializationList=[];
  void getSpecialization()async{
    emit(SpecializationHomeLoading());
    try{
      final response= await homeRepo.getSpecialization();
      if(response.code==200){
        specializationList=response.specializationData;
        //TODO:call function and show all doctor of first specialization by default as start
        getDoctorList(specializationId: specializationList?.first?.id);
        emit(SpecializationHomeWithSuccessfully(specializationResponseModel: response));
      }
      else{
        print("Error from Response ${response.code}");
        emit(SpecializationHomeWithError(errorHandler: ApiErrorHandler.handle(response)));
      }
    }catch(error){
      print("Error from cubit $error");
      emit(SpecializationHomeWithError(errorHandler: ApiErrorHandler.handle(error)));
    }
  }

  void getDoctorList({required int? specializationId}){
    /*اللى انا عملته ده معناه انى بقول لكل عنصر فىspecializationList شوفلى العنصر اللىid بتاعه
    يساوىid اللى انا باعتها ولو لقيته رجعلى الدكاتره اللى فى التخصص ده
    * */
   List<DoctorModel>?doctorsList= specializationList?.firstWhere((element)=>element?.id==specializationId)?.doctors;
   if(doctorsList !=null && doctorsList.isNotEmpty){
     emit(GetDoctorsListSuccessfully(doctors: doctorsList));
   }
   else{
     emit(GetDoctorsListWithError(error: ApiErrorHandler.handle("no found doctor")));
   }
  }
}
