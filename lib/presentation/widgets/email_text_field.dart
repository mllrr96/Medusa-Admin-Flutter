import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

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
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final tr = context.tr;
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(4)));
    return TextFormField(
      readOnly: readOnly ,
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
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
          prefixIcon: const IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 16.0),
                Icon(Icons.mail, color: manatee),
                SizedBox(width: 12.0),
                VerticalDivider(indent: 10, endIndent: 10),
                SizedBox(width: 12.0),
              ],
            ),
          )),
    );
  }
}
