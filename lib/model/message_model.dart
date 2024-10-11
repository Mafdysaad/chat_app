import 'package:chatapp/const/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String message;
  String Id;
  Timestamp date;
  MessageModel(this.message, this.Id, this.date);
  factory MessageModel.fromjeson(jsondata) {
    return MessageModel(
        jsondata[kmessageId], jsondata[kid], jsondata[kcreatAt]);
  }
}
