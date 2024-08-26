import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:solvodev_mobile_structure/app/core/components/buttons/icon_button_component.dart';
import 'package:solvodev_mobile_structure/app/core/components/inputs/text_input_component.dart';
import 'package:solvodev_mobile_structure/app/core/components/others/header_component.dart';
import 'package:solvodev_mobile_structure/app/core/constants/get_builders_ids_constants.dart';
import 'package:solvodev_mobile_structure/app/core/constants/icons_assets_constants.dart';
import 'package:solvodev_mobile_structure/app/core/styles/main_colors.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(
          backButtonBackgroundColor: Colors.yellow,
          backgroundColor: Colors.yellow[900],
          titleWidget: Row(
            children: [
              Image.asset('assets/images/logo.png', height: 25),
              SizedBox(width: 10),
              Text('MessageMe')
            ],
          ),
          actionWidget: IconButtonComponent(
            onTap: () {
              // controller.getCurrentUser();
              controller.auth.signOut();
              Navigator.pop(context);
            },
            iconLink: IconsAssetsConstants.closeIcon,
            backgroundColor: Colors.yellow[900],
          )),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GetBuilder<ChatController>(
            id: GetBuildersIdsConstants.chatMessagesComponent,
            builder: (chatController) {
              return Container(
                width: 1.sw,
                height: 1.sh,
                child: ListView.separated(
                  reverse: true,
                  itemCount: chatController.chatMessages.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: ListTile(
                          title: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${controller.singedInUser?.email}',
                              style: TextStyle(color: Colors.yellow[900]),
                            ),
                            Material(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                ),
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text(
                                    '${chatController.chatMessages[index].text}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )),
                          ],
                        ),
                      )),
                    );
                  },
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextInputComponent(
                        borderRadius: 0,
                        controller: controller.messageTextController,
                        onChange: (value) {
                          controller.messageText = value;
                        },
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hint: 'Write your message here...',
                      ),
                    ),
                    Container(
                      color: MainColors.primaryColor,
                      child: TextButton(
                        onPressed: () {
                          controller.messageTextController.clear();
                          controller.firestore.collection('messages').add({
                            'text': controller.messageText,
                            'sender': controller.singedInUser != null
                                ? controller.singedInUser!.email
                                : '',
                            'time': FieldValue.serverTimestamp(),
                          });
                        },
                        child: Text(
                          'send',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
