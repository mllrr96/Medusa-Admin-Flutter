import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

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
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final tr = context.tr;
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(4)));
    return TextFormField(
      controller: widget.controller,
      autofocus: widget.autoFocus,
      onChanged: widget.onChanged,
      textInputAction: TextInputAction.done,
      style: mediumTextStyle,
      validator: widget.validator,
      maxLines: 1,
      cursorColor: manatee,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.theme.appBarTheme.backgroundColor,
        border: border,
        hintText: widget.hintText ?? tr.loginCardPassword,
        enabledBorder: border,
        contentPadding: EdgeInsets.zero,
        prefixIcon: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 16.0),
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, anim) => FadeTransition(
                        opacity: child.key == const ValueKey('icon1')
                            ? Tween<double>(begin: 1, end: 1).animate(anim)
                            : Tween<double>(begin: 1, end: 1).animate(anim),
                        child: FadeTransition(opacity: anim, child: child),
                      ),
                  child: obscureText
                      ? const Icon(Icons.lock,
                          key: ValueKey('icon1'), color: manatee)
                      : const Icon(
                          Icons.lock_open,
                          color: manatee,
                          key: ValueKey('icon2'),
                        )),
              const SizedBox(width: 12.0),
              const VerticalDivider(indent: 10, endIndent: 10),
              const SizedBox(width: 12.0),
            ],
          ),
        ),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: manatee,
            )),
      ),
    );
  }
}