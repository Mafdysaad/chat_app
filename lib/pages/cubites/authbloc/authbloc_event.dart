part of 'authbloc_bloc.dart';

@immutable
sealed class AuthblocEvent {}

class Loginevent extends AuthblocEvent {
  final String email, password;
  Loginevent(this.email, this.password);
}

class Registerevent extends AuthblocEvent {
  final String email, password;
  Registerevent(this.email, this.password);
}
