import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'package:medusa_admin/presentation/widgets/email_text_field.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'components/sign_in_medusa_logo.dart';

@RoutePage()
class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final emailCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool rotate = false;
  void setLoading(bool value) => setState(() => rotate = value);

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final tr = context.tr;
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        state.mapOrNull(
          loading: (_) {
            setLoading(true);
            context.unfocus();
          },
          success: (_) {
            setLoading(false);
            if (mounted) {
              context.popRoute();
            }
          },
          error: (error) {
            setLoading(false);
            context.showSignInErrorSnackBar(error.failure.toSnackBarString());
          },
        );
      },
      child: HideKeyboard(
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
                onPressed: rotate
                    ? null
                    : () {
                        if (formKey.currentState?.validate() == false) {
                          return;
                        }
                        context
                            .read<ResetPasswordCubit>()
                            .resetPassword(emailCtrl.text);
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
                    child: SignInMedusaLogo(rotate: rotate),
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
                      child: Form(
                        key: formKey,
                        child: EmailTextField(
                          controller: emailCtrl,
                          enabled: !rotate,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (email) {
                            if (formKey.currentState?.validate() == false) {
                              return;
                            }
                            context
                                .read<ResetPasswordCubit>()
                                .resetPassword(email);
                          },
                          validator: (val) {
                            if (val?.isEmpty == true) {
                              return 'Field is required';
                            }

                            if (!emailCtrl.text.isEmail) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  // const Gap(10.0),
                  // GestureDetector(
                  //   onTap: () => controller.errorMessage.value = '',
                  //   child: errorMessage(
                  //     errorMessage: controller.errorMessage,
                  //     context: context,
                  //     emptyChildHeight: 0,
                  //     horizontalPadding: 12.0,
                  //   ),
                  // ),
                  // const Gap(10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
