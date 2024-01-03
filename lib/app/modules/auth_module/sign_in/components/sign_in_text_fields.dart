import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.onChanged, this.validator,
  });
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final tr = context.tr;
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(4)));
    return TextFormField(
      controller: widget.controller,
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
        hintText: tr.loginCardPassword,
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
                      ? Icon(Icons.lock, key: const ValueKey('icon1'), color: manatee)
                      : Icon(
                          Icons.lock_open,
                          color: manatee,
                          key: const ValueKey('icon2'),
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

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction = TextInputAction.next, this.validator,
  });
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final tr = context.tr;
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(4)));
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      style: mediumTextStyle,
      validator: validator,
      decoration: InputDecoration(
          filled: true,
          fillColor: context.theme.appBarTheme.backgroundColor,
          border: border,
          enabledBorder: border,
          hintText: tr.loginCardEmail,
          contentPadding: EdgeInsets.zero,
          prefixIcon: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 16.0),
                Icon(Icons.mail, color: manatee),
                const SizedBox(width: 12.0),
                const VerticalDivider(indent: 10, endIndent: 10),
                const SizedBox(width: 12.0),
              ],
            ),
          )),
    );
  }
}
