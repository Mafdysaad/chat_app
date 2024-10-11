import 'package:chatapp/const/const.dart';
import 'package:chatapp/model/message_model.dart';
import 'package:chatapp/widget/chat_page/bubble_freind.dart';
import 'package:chatapp/widget/chat_page/bubble_text.dart';
import 'package:chatapp/widget/logo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'chatpage';
  TextEditingController controller = TextEditingController();
  FirebaseFirestore message = FirebaseFirestore.instance;
  ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    // to receive arguments
    String? email = ModalRoute.of(context)!.settings.arguments as String;

    return StreamBuilder<QuerySnapshot>(
        stream: message
            .collection('message')
            .orderBy(kcreatAt, descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> List_message = [];
            for (var element in snapshot.data!.docs) {
              List_message.add(MessageModel.fromjeson(element));
            }
            return Scaffold(
              appBar: AppBar(
                // centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: kPrimaryColor,
                toolbarHeight: 89,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Logo(size: 42)),
                      const Text(
                        'chat',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: scroll,
                        itemCount: List_message.length,
                        itemBuilder: (context, index) {
                          return snapshot.data!.docs[index][kid] == email
                              ? BubbleText(message: List_message[index])
                              : BubbleFreind(
                                  message: List_message[index],
                                );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (value) {
                        message.collection(kmessageId).add({
                          kmessageId: value,
                          kcreatAt: DateTime.now(),
                          kid: email
                        });
                        controller.clear();
                        scroll.animateTo(0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);
                      },
                      decoration: InputDecoration(
                        hintText: 'Send Message',
                        enabled: true,
                        suffixIcon: const Icon(Icons.send),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: kPrimaryColor, width: 3),
                            borderRadius: BorderRadius.circular(16)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
