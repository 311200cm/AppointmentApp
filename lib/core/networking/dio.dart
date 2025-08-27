import 'package:appointment_app/core/helpers/shared_preferences_helper.dart';
import 'package:appointment_app/core/helpers/shared_preferences_keys.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//TODO: this class suatable with any project
class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      addDioHeaders();
      return dio!;
    } else {
      return dio!;
    }
  }
  //TODO:this function show request and response in terminal
  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
      'Bearer ${await SharedPreferencesHelper.getSecuredString(SharedPreferencesKeys.userToke)}'
    };
  }
  /*عملنا الfunction دى علشانaddDioHeaders بتتنادى مره واحده اول ما البرنامج يشتغل
  علشان انا بنشا نسخه منdio مره واحده بسببgetit
  فبالتالى هو بيروح ينادى الfunction بتاعتaddDioheader
  قبل ما ياخدtoken ومش بيناديها تانى لانه مش هينشا نسخه تانى منdio فبالتالى دايماtoken
  هيرجع فاضى فانا عايزه اعمل حاجه تعمل شبهrefresh للdio بعد ما اجيبtoken علشان اعرف ابعته
  فعملت الfunction
  اللى تحت دى
  * */
  static void getTokenAfterLoginOrSignUp(String token){
    dio?.options.headers = {
    'Authorization':
    'Bearer $token'
    };
  }
}