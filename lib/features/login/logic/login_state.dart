part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}
class LoginWithError extends LoginState{
  ErrorHandler error;
  LoginWithError({required this.error});
}
class LoginSuccessfully extends LoginState{

  LoginResponse loginResponse;

  LoginSuccessfully({required this.loginResponse});
}