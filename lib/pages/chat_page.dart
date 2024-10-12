import 'package:chatapp/const/const.dart';
import 'package:chatapp/model/message_model.dart';
import 'package:chatapp/pages/cubites/Login_cubit/login_cubit.dart';
import 'package:chatapp/pages/cubites/chat_cubit/chat_cubit.dart';
import 'package:chatapp/widget/chat_page/bubble_freind.dart';
import 'package:chatapp/widget/chat_page/bubble_text.dart';
import 'package:chatapp/widget/logo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static const String id = 'chatpage';
  final TextEditingController controller = TextEditingController();
  final ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    // to receive arguments
    String? email = ModalRoute.of(context)!.settings.arguments.toString();

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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                return ListView.builder(
                    reverse: true,
                    controller: scroll,
                    itemCount: BlocProvider.of<ChatCubit>(context)
                        .messages_list
                        .length,
                    itemBuilder: (context, index) {
                      return BlocProvider.of<ChatCubit>(context)
                                  .messages_list[index]
                                  .Id ==
                              email
                          ? BubbleText(
                              message: BlocProvider.of<ChatCubit>(context)
                                  .messages_list[index])
                          : BubbleFreind(
                              message: BlocProvider.of<ChatCubit>(context)
                                  .messages_list[index],
                            );
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context).sentmessage(value, email);
                controller.clear();
                scroll.animateTo(0,
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                enabled: true,
                suffixIcon: const Icon(Icons.send),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 3),
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
  }
}
