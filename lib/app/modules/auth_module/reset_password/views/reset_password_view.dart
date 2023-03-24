import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/auth_module/sign_in/components/sign_in_button.dart';
import 'package:medusa_admin/app/modules/auth_module/sign_in/components/sign_in_text_fields.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';

import '../../../components/error_widget.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child:
              SignInButton(onPressed: () async => await controller.resetPassword(), label: 'Send reset instructions'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/medusa.png', scale: 5),
                    Text('Reset your password', style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 18.0),
                    Text(
                        "Enter your email address below, and we'll send you instructions on how to reset your password.",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: lightWhite),
                        textAlign: TextAlign.center),
                  ],
                ),
                const SizedBox(height: 18.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: EmailTextField(
                    controller: controller.emailCtrl,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) async => await controller.resetPassword(),
                  ),
                ),
                const SizedBox(height: 9.0),
                InkWell(
                  onTap: () => controller.errorMessage.value = '',
                  child: errorMessage(
                    errorMessage: controller.errorMessage,
                    context: context,
                    emptyChildHeight: 0,
                    horizontalPadding: 12.0,
                    radius: 10.0,
                  ),
                ),
                const SizedBox(height: 9.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
