import 'package:chatapp/const/const.dart';
import 'package:chatapp/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  FirebaseFirestore messages = FirebaseFirestore.instance;
  List<MessageModel> messages_list = [];
  ChatCubit() : super(chat_Inatial());
  sentmessage(value, email) {
    try {
      FirebaseFirestore.instance
          .collection(kmessageId)
          .add({kmessageId: value, kcreatAt: DateTime.now(), kid: email});
    } on Exception catch (e) {
      // TODO
    }
  }

  getmessage() {
    messages
        .collection('message')
        .orderBy(kcreatAt, descending: true)
        .snapshots()
        .listen((event) {
      messages_list.clear();
      for (var element in event.docs) {
        messages_list.add(MessageModel.fromjeson(element));
      }
      emit(Chatsuccess(messages_list));
    });
  }
}
