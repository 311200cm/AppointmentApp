part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//TODO: state of login
class LoginLoading extends AuthState{}
class LoginWithError extends AuthState{
  ErrorHandler error;
  LoginWithError({required this.error});
}
class LoginSuccessfully extends AuthState{

  LoginResponse loginResponse;

  LoginSuccessfully({required this.loginResponse});
}

//TODO:State of signup

class SignupLoading extends AuthState{}
class SignupSuccessfully extends AuthState{
  SignupResponse signupResponse;
  SignupSuccessfully({required this.signupResponse});
}
class SignupWithError extends AuthState{

  ErrorHandler errorHandler;

  SignupWithError({required this.errorHandler});
}
