import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.required = false,
    required this.label,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.hintText,
    this.maxLines = 1,
    this.onChanged,
    this.width,
    this.lightLabelColor = false,
    this.validator,
    this.autoFocus = false,
    this.enabled = true,
    this.fillColor,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap, this.onFieldSubmitted,
  });

  final bool required;
  final bool autoFocus;
  final bool enabled;
  final bool readOnly;
  final String label;
  final String? hintText;
  final int? maxLines;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final double? width;
  final bool lightLabelColor;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color lightWhite = isDarkMode ? Colors.white54 : Colors.black54;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Row(
            children: [
              Text(label, style: mediumTextStyle!.copyWith(color: lightLabelColor ? lightWhite : null)),
              if (required) Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
            ],
          ),
          const SizedBox(height: 6.0),
          TextFormField(
            autofocus: autoFocus,
            readOnly: readOnly,
            onTap: onTap,
            enabled: enabled,
            obscureText: obscureText,
            textCapitalization: textCapitalization,
            controller: controller,
            textInputAction: textInputAction,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: enabled ? null : lightWhite),
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  // borderRadius: BorderRadius.all(Radius.circular(16.0))
                ),
                filled: true,
                fillColor: fillColor ?? Theme.of(context).scaffoldBackgroundColor,
                hintText: hintText,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                )),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
