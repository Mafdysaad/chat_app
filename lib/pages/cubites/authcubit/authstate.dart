part of 'authcubit.dart';

sealed class Authstate {}

final class AuthCubitInitial extends Authstate {}

final class Lodingstate extends Authstate {}

final class SuccessState extends Authstate {}

final class FailureState extends Authstate {
  String error;
  FailureState(this.error);
}

final class Registerloding extends Authstate {}

final class Registersuccess extends Authstate {}

final class Registerfuilar extends Authstate {
  String error;
  Registerfuilar(this.error);
}
