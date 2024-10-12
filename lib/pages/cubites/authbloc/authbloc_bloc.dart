import 'package:bloc/bloc.dart';
import 'package:chatapp/function/login.dart';
import 'package:chatapp/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthblocBloc extends Bloc<AuthblocEvent, Authstate> {
  AuthblocBloc() : super(AuthblocInitial()) {
    on<AuthblocEvent>((event, emit) async {
      if (event is Loginevent) {
        emit(Lodingstate());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(SuccessState());
        } on FirebaseException catch (e) {
          emit(FailureState(e.code));
        } on Exception {
          emit(FailureState('something went wrong'));
        }
      } else if (event is Registerevent) {
        try {
          emit(Registerloding());
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(Registersuccess());
        } on FirebaseException catch (e) {
          emit(Registerfuilar(e.code));
        } on Exception {
          emit(Registerfuilar('something went wrong'));
        }
      }
    });
  }
}
