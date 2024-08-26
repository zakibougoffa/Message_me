
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solvodev_mobile_structure/app/data/models/chat_message_model.dart';

class FirebaseProvider {
  static StreamSubscription? newMessageStream;

  static void startChatMessagesStream({
    required Function(ChatMessageModel) onChatMessageAdded,
  }) {
    var collectionReference = FirebaseFirestore.instance.collection("messages").orderBy('time');
    //when the ride status value only is updated the stream will be notified
    newMessageStream =
        collectionReference.snapshots().listen((QuerySnapshot messages) {
          if (messages.docs.reversed.isNotEmpty) {
            for (var message in messages.docs.reversed) {
              onChatMessageAdded(ChatMessageModel.fromJson(
                  message.data() as Map<String, dynamic>));
            }
          }
        });
  }

  static void stopChatMessagesStream() {
    if (newMessageStream != null) {
      newMessageStream?.cancel();
    }
    newMessageStream = null;
  }
}

