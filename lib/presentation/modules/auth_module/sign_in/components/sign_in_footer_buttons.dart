import 'package:flutter/material.dart';
import 'package:medusa_admin/data/service/storage_service.dart';
import 'package:medusa_admin/core/extension/extension.dart';

class SignInFooterButtons extends StatelessWidget {
  const SignInFooterButtons(this.reAuthenticate,
      {super.key,
       this.onGoToSignInPressed,
       this.onUrlPressed});
  final bool reAuthenticate;
  final void Function()? onGoToSignInPressed;
  final void Function()? onUrlPressed;

  @override
  Widget build(BuildContext context) {
    String? baseUrl = StorageService.baseUrl;
    bool isUrlSet = baseUrl != null;
    if (reAuthenticate) {
      return FilledButton.icon(
          style: FilledButton.styleFrom(
            minimumSize: const Size(220, 48.0),
          ),
          onPressed: onGoToSignInPressed,
          icon: const Icon(Icons.refresh_outlined),
          label: const Text('Go to Sign In'));
    }
    return ElevatedButton.icon(
      onPressed: onUrlPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isUrlSet ? null : Colors.red,
        minimumSize: const Size(110, 48.0),
      ),
      label: isUrlSet
          ? const Text('Update URL')
          : Text('Set URL',
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
