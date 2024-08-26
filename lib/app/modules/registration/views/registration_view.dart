import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:solvodev_mobile_structure/app/core/components/buttons/primary_button_component.dart';
import 'package:solvodev_mobile_structure/app/core/components/inputs/text_input_component.dart';
import 'package:solvodev_mobile_structure/app/core/utils/validator_util.dart';
import '';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key:controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 180,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(height: 50),
              TextInputComponent(
                fillColor: Colors.deepPurple,
                hint: 'Entre your email',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                textInputType: TextInputType.emailAddress,
                onChange: (value){
                  controller.email = value;
                  },
                validate: (value)=>ValidatorUtil.emailValidation(value),
                border: BorderSide(
                  color: Colors.orange,
                  width: 1,
                ),
                borderRadius: 10.0,
              ),
              const SizedBox(height: 8),
              TextInputComponent(
                fillColor: Colors.deepPurple,
                hint: 'Entre your password',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
               obscureText: true,
                onChange: (value){
                  controller.email = value;
                  },
                validate: (value)=>ValidatorUtil.passwordValidation(value),

                border: BorderSide(
                  color: Colors.orange,
                  width: 1,
                ),
                borderRadius: 10.0,
              ),
              const SizedBox(height: 10),
              PrimaryButtonComponent(
                backgroundColor: Colors.blue[800]!,
                text: 'register',
                onTap: ()  {

                  controller.createAccount();                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
