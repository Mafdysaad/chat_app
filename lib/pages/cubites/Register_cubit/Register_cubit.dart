import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'Register_State.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterCubitInitial());
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
