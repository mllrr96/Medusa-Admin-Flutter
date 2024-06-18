import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
  });
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {

    return ShadInputFormField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      validator: validator,
      enabled: enabled,
      readOnly: readOnly,
      prefix: const Icon(LucideIcons.mail),
      placeholder: Text(context.tr.loginCardEmail),
      // hintText: context.tr.loginCardEmail,
      // prefixIcon: const Icon(Icons.mail),
    );
  }
}
