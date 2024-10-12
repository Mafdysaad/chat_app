part of 'chat_cubit.dart';

sealed class ChatState {}

class chat_Inatial extends ChatState {}

class Chatsuccess extends ChatState {
  List<MessageModel> massges;
  Chatsuccess(this.massges);
}
