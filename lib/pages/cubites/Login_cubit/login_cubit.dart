import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginCubitInitial());
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
}
