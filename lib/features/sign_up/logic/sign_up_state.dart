part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

class SignupLoading extends SignUpState{}
class SignupSuccessfully extends SignUpState{
  SignupResponse signupResponse;
  SignupSuccessfully({required this.signupResponse});
}
class SignupWithError extends SignUpState{

  ErrorHandler errorHandler;

  SignupWithError({required this.errorHandler});
}
