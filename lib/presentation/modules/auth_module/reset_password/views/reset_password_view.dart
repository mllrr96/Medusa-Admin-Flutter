import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/domain/use_case/reset_password_use_case.dart';
import 'package:medusa_admin/presentation/modules/auth_module/sign_in/components/index.dart';
import 'package:medusa_admin/presentation/widgets/error_widget.dart';

import '../../../../../core/constant/colors.dart';
import '../controllers/reset_password_controller.dart';

@RoutePage()
class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final tr = context.tr;
    return GetBuilder<ResetPasswordController>(
      init: ResetPasswordController(
          resetPasswordUseCase: ResetPasswordUseCase.instance),
      builder: (controller) {
        bool loading = controller.rotate;
        return GestureDetector(
          onTap: () => context.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: context.defaultSystemUiOverlayStyle,
              leading: const CloseButton(),
              backgroundColor: context.theme.scaffoldBackgroundColor,
            ),
            persistentFooterAlignment: AlignmentDirectional.center,
            persistentFooterButtons: [
              Hero(
                tag: 'continue',
                child: FilledButton(
                  onPressed:loading ? null : () async {
                    await controller.resetPassword().then((result) {
                      if (result) {
                        context.popRoute();
                      }
                    });
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(context.width / 3, 48.0),
                  ),
                  child: Text(tr.resetTokenCardSendResetInstructions),
                ),
              ),
            ],
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(30.0),
                    Hero(
                      tag: 'medusa',
                      child: SignInMedusaLogo(rotate: controller.rotate),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(tr.resetTokenCardResetYourPassword,
                            style: context.headlineMedium),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            tr.resetTokenCardPasswordResetDescription,
                            style: context.bodyMedium?.copyWith(color: manatee),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const Gap(18.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Hero(
                        tag: 'email',
                        child: EmailTextField(
                          controller: controller.emailCtrl,
                          enabled: !loading,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) async =>
                              await controller.resetPassword(),
                        ),
                      ),
                    ),
                    const Gap(10.0),
                    GestureDetector(
                      onTap: () => controller.errorMessage.value = '',
                      child: errorMessage(
                        errorMessage: controller.errorMessage,
                        context: context,
                        emptyChildHeight: 0,
                        horizontalPadding: 12.0,
                      ),
                    ),
                    const Gap(10.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
