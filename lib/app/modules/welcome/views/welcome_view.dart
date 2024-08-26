import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:solvodev_mobile_structure/app/core/components/buttons/primary_button_component.dart';
import 'package:solvodev_mobile_structure/app/routes/app_pages.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Text(
                  'MessageMe',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff2e386b),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            PrimaryButtonComponent(
              backgroundColor: Colors.yellow[900]!,
              text: 'Sign in',
              onTap:()=>Get.toNamed(Routes.SIGNIN),
            ),
            const SizedBox(height: 10, ),
            PrimaryButtonComponent(
              backgroundColor: Colors.blue[800]!,
              text: 'register',
              onTap:()=>Get.toNamed(Routes.REGISTRATION),
            )
          ],
        ),
      ),
    );
  }
}
