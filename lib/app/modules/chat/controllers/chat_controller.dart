import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solvodev_mobile_structure/app/core/constants/get_builders_ids_constants.dart';
import 'package:solvodev_mobile_structure/app/data/models/chat_message_model.dart';
import 'package:solvodev_mobile_structure/app/data/providers/firebase_api/firebase_provider.dart';

class ChatController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
   User? singedInUser ;
   User? messageSender ;
   User? currentUser;
   bool? isMe;

  final messageTextController = TextEditingController();
  final count = 0.obs;

  String? messageText;

  bool isLoadingMessages = false;
  void changeIsLoadingMessages(bool value) {
    isLoadingMessages = value;
    update([
      GetBuildersIdsConstants.chatMessagesComponent,
    ]);
  }

  List<ChatMessageModel> chatMessages = [];

  void changeChatMessages(ChatMessageModel newChatMessage) {
    chatMessages.add(newChatMessage);
    update([
      GetBuildersIdsConstants.chatMessagesComponent,
    ]);
  }

  void startChatMessagesStream() {
    FirebaseProvider.startChatMessagesStream(
      onChatMessageAdded: (newChatMessage) async {
        changeChatMessages(newChatMessage);
      },
    );
  }

  void getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        singedInUser = user;
        print(singedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

// // void getMessages()async{
// //     final messages = await firestore.collection('messages').get();
// //     for(var message in messages.docs){
// //       print(message.data());
// //
// //     }
// }
  void messagesStreams() async {
    await for (var snapshot in firestore.collection('messages').orderBy('time').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  void onInit() {
    startChatMessagesStream();
    super.onInit();
    getCurrentUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    FirebaseProvider.stopChatMessagesStream();
    super.onClose();
  }

  void increment() => count.value++;
}
