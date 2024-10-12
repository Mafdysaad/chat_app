part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginCubitInitial extends LoginState {}

final class Lodingstate extends LoginState {}

final class SuccessState extends LoginState {}

final class FailureState extends LoginState {
  String error;
  FailureState(this.error);
}
