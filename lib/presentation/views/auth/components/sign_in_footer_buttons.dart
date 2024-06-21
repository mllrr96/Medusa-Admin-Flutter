import 'package:flutter/material.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SignInFooterButtons extends StatelessWidget {
  const SignInFooterButtons(this.reAuthenticate,
      {super.key,
      this.onGoToSignInPressed,
      this.onUrlPressed,
      this.onUrlLongPressed});
  final bool reAuthenticate;
  final void Function()? onGoToSignInPressed;
  final void Function()? onUrlPressed;
  final void Function()? onUrlLongPressed;

  @override
  Widget build(BuildContext context) {
    String? baseUrl = AuthPreferenceService.baseUrlGetter;
    bool isUrlSet = baseUrl != null;
    if (reAuthenticate) {
      return ShadButton(
        onPressed: onGoToSignInPressed,
        text: const Text('Go to Sign In'),
        icon: const Icon(Icons.refresh_outlined),
      );
    }

    return ShadButton.destructive(
      onPressed: onUrlPressed,
      onLongPress: onUrlLongPressed,
      text: Text('Configure URL',
          style: isUrlSet
              ? null
              : context.bodySmall?.copyWith(color: Colors.white)),
      icon: Icon(
        Icons.link,
        color: isUrlSet ? null : Colors.white,
      ),
    );
  }
}
