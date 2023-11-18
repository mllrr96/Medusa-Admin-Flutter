import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
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
    this.onTap,
    this.onFieldSubmitted,
    this.decoration,
    this.isDense,
    this.inputFormatters,
    this.includeSpace = true, this.style,
  });

  final bool required;
  final bool includeSpace;
  final bool autoFocus;
  final bool enabled;
  final bool readOnly;
  final String label;
  final String? hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final double? width;
  final bool lightLabelColor;
  final bool? isDense;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final Color? fillColor;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(child: Text(label, style: mediumTextStyle!.copyWith(color: lightLabelColor ? lightWhite : null), maxLines: 1, overflow: TextOverflow.ellipsis)),
              if (required) Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
            ],
          ),
          halfSpace,
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
            inputFormatters: inputFormatters,
            validator: validator,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: style  ?? smallTextStyle?.copyWith(color: enabled ? null : lightWhite),
            decoration: decoration ??
                InputDecoration(
                  isDense: isDense,
                  hintText: hintText,
                ),
          ),
          if(includeSpace)
          space,
        ],
      ),
    );
  }
}
