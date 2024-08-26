import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solvodev_mobile_structure/app/routes/app_pages.dart';

class SigninController extends GetxController {
final auth = FirebaseAuth.instance;
final formKey = GlobalKey<FormState>();

  String email = '';
String password = '';
  final count = 0.obs;



void signIn(){ if (!formKey.currentState!.validate())return;
auth.signInWithEmailAndPassword(email: email, password: password);
Get.toNamed(Routes.CHAT);
}


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
