import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/sign_in/components/sign_in_button.dart';
import 'package:medusa_admin/app/modules/sign_in/components/sign_in_text_fields.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/medusa.png', scale: 5),
                  Text('Welcome back!', style: Theme.of(context).textTheme.displayLarge),
                  Text('It\'s great to see you 👋🏼', style: Theme.of(context).textTheme.titleMedium),
                  Text('Log in to your account below', style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              const SizedBox(height: 36.0),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text(
                    'Reset password',
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SignInButton(
                  onPress: () => Get.offAllNamed(Routes.DASHBOARD),
                  label: 'Continue',
                  buttonWidth: double.maxFinite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
