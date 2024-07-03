import 'package:flutter/material.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UpdateUrlButton extends StatelessWidget {
  const UpdateUrlButton({
    super.key,
    this.onUrlPressed,
  });
  final void Function()? onUrlPressed;

  @override
  Widget build(BuildContext context) {
    String? baseUrl = AuthPreferenceService.baseUrlGetter;
    bool isUrlSet = baseUrl != null;

    if (!isUrlSet) {
      return ShadButton.destructive(
        size: ShadButtonSize.icon,
        onPressed: onUrlPressed,
        icon: const Icon(Icons.link),
      );
    }

    return ShadButton.outline(
      size: ShadButtonSize.icon,
      onPressed: onUrlPressed,
      icon: const Icon(Icons.link),
    );
  }
}
