import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';



class ApiErrorHandler  {

 static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch(error.type){
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection server is failed");

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection time out");

        case DioExceptionType.cancel:
          return ApiErrorModel(message: " Cancelled this request");

        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);

        default:
          return ApiErrorModel(message: "Unknown error ");
      }
    } else {
      // default error
      return ApiErrorModel(message: "Unknown error happened");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {

   return ApiErrorModel(
     message: data["message"] ?? "Something wrong",
     code: data["code"],
     errorMap: data["data"],
   );
 }



