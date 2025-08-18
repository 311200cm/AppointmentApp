import 'package:appointment_app/core/networking/api_services.dart';
import 'package:appointment_app/features/auth/auth_cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/sign_up/data/repo/sign_up_repo.dart';

import '../networking/dio.dart';
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  //TODO:بستخدم registerLazySingleton علشان انشا object واحد واستخدمه طول الابلكيشن مش اعمل object كل مره
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  //getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt(),getIt()));
}