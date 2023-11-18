import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/auth_module/sign_in/components/sign_in_button.dart';
import 'package:medusa_admin/app/modules/auth_module/sign_in/components/sign_in_text_fields.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../core/utils/colors.dart';
import '../../../components/error_widget.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final bottomPadding =
        context.bottomViewPadding == 0 ? 20.0 : context.bottomViewPadding;
    final tr = context.tr;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const Hero(tag: 'closeReset', child: AdaptiveCloseButton()),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: bottomPadding),
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Hero(
              tag: 'continue',
              child: SignInButton(onPressed: () async => await controller.resetPassword(), label: tr.sendInstructions)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                Hero(
                  tag: 'medusa',
                  child: Image.asset(
                    'assets/images/medusa.png',
                    scale: 5,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(tr.resetYourPassword, style: context.headlineMedium),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        tr.sendInstructionsDescription,
                        style: context.bodyMedium?.copyWith(color: lightWhite),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Hero(
                    tag: 'email',
                    child: EmailTextField(
                      controller: controller.emailCtrl,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) async => await controller.resetPassword(),
                    ),
                  ),
                ),
                const Hero(
                  tag: 'password',
                  child: SizedBox(
                    width: double.maxFinite,
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
