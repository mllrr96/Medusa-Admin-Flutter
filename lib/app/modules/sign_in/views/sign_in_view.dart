import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/sign_in/components/sign_in_button.dart';
import 'package:medusa_admin/app/modules/sign_in/components/sign_in_text_fields.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SignInView'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Welcome back!', style: Theme.of(context).textTheme.displayLarge),
                Text('It\'s great to see you 👋🏼', style: Theme.of(context).textTheme.titleMedium),
                Text('Log in to your account below', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  EmailTextField(controller: TextEditingController()),
                  const SizedBox(height: 12.0),
                  PasswordTextField(controller: TextEditingController()),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SignInButton(onPress: () {}, label: 'Continue', buttonWidth: double.maxFinite,),
            ),
          ],
        )));
  }
}
