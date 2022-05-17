part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginValidate extends LoginState {
  final bool isValidate;

  LoginValidate(this.isValidate);
}

class LoginLoading extends LoginState {
  final bool isLoading;

  LoginLoading(this.isLoading);
}

class LoginCompleted extends LoginState {
  final LoginResponseModel model;

  LoginCompleted(this.model);
}

class LoginError extends LoginState {}
