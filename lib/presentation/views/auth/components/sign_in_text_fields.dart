import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.validator,
    this.hintText,
    this.autoFocus = false,
  });
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool autoFocus;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {

    return ShadInputFormField(
      controller: widget.controller,
      validator: widget.validator,
      prefix: const Padding(
        padding: EdgeInsets.all(4.0),
        child: ShadImage.square(size: 16, LucideIcons.lock),
      ),
      placeholder: Text(context.tr.loginCardPassword),
      suffix: ShadButton(
        width: 24,
        height: 24,
        padding: EdgeInsets.zero,
        decoration: const ShadDecoration(
          secondaryBorder: ShadBorder.none,
          secondaryFocusedBorder: ShadBorder.none,
        ),
        icon: ShadImage.square(
          size: 16,
         obscureText ? LucideIcons.eye : LucideIcons.eyeOff,
        ),
        onPressed: () => setState(() => obscureText = !obscureText),
      ),
      textInputAction: TextInputAction.done,
      maxLines: 1,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
    );
  }
}