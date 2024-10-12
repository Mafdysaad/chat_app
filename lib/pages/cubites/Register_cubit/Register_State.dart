part of 'Register_cubit.dart';

sealed class RegisterState {}

final class RegisterCubitInitial extends RegisterState {}

final class Registerloding extends RegisterState {}

final class Registersuccess extends RegisterState {}

final class Registerfuilar extends RegisterState {
  String error;
  Registerfuilar(this.error);
}
