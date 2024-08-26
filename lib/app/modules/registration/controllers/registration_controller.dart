import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvodev_mobile_structure/app/routes/app_pages.dart';
class RegistrationController extends GetxController {
String email = '';
 String password = '' ;
 final formKey = GlobalKey<FormState>();

final auth = FirebaseAuth.instance;




void createAccount(){ if (!formKey.currentState!.validate())return;
  auth.createUserWithEmailAndPassword(email: email, password: password);
 Get.toNamed(Routes.CHAT);
}







  final count = 0.obs;
@override
void dispose() {

  super.dispose();
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
