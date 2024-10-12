import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authstate.dart';

class Authcubit extends Cubit<Authstate> {
  Authcubit() : super(AuthCubitInitial());

  Future<void> loginuser(String email, String password) async {
    emit(Lodingstate());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SuccessState());
    } on FirebaseException catch (e) {
      emit(FailureState(e.code));
    } on Exception {
      emit(FailureState('something went wrong'));
    }
  }

  Future<void> registeruser(String email, String password) async {
    try {
      emit(Registerloding());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(Registersuccess());
    } on FirebaseException catch (e) {
      emit(Registerfuilar(e.code));
    } on Exception {
      emit(Registerfuilar('something went wrong'));
    }
  }
}
