part of 'authbloc_bloc.dart';

@immutable
sealed class Authstate {}

final class AuthblocInitial extends Authstate {}

final class Lodingstate extends Authstate {}

final class SuccessState extends Authstate {}

final class FailureState extends Authstate {
  final String error;
  FailureState(this.error);
}

final class Registerloding extends Authstate {}

final class Registersuccess extends Authstate {}

final class Registerfuilar extends Authstate {
  final String error;
  Registerfuilar(this.error);
}
