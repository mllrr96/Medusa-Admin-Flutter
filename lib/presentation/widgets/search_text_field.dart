import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

import '../../../core/utils/medusa_icons_icons.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.focusNode,
    required this.controller,
    this.hintText,
    this.onChanged,
    this.onSuffixTap,
    this.suffixIconData,
    this.androidPadding,
    this.fillColor,
    this.onSubmitted,
    this.autoFocus = false,
    this.prefixIconData,
    this.textInputAction,
    this.maxLines = 1,
    this.contentPadding,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
  });
  final FocusNode? focusNode;
  final TextEditingController controller;
  final String? hintText;
  final Color? fillColor;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onSuffixTap;
  final IconData? suffixIconData;
  final IconData? prefixIconData;
  final EdgeInsets? androidPadding;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization textCapitalization;
  @override
  Widget build(BuildContext context) {
    const constraints = BoxConstraints(minWidth: 30.0, minHeight: 40);
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(
        Radius.circular(4.0),
      ),
    );
    return TextField(
      controller: controller,
      style: smallTextStyle,
      autocorrect: false,
      autofocus: autoFocus,
      keyboardType: textInputType,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      textInputAction: textInputAction ?? TextInputAction.search,
      onSubmitted: onSubmitted,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        suffixIconConstraints: constraints,
        suffixIcon: Material(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          color: fillColor ?? context.theme.appBarTheme.backgroundColor,
          child: InkWell(
            borderRadius: const BorderRadius.horizontal(right: Radius.circular(4.0)),
            onTap: onSuffixTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(suffixIconData ?? CupertinoIcons.xmark_circle_fill),
            ),
          ),
        ),
        prefixIconConstraints: constraints,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(12),
            Icon(prefixIconData ?? MedusaIcons.magnifying_glass_mini, color: manatee),
            const Gap(12),
          ],
        ),
        isDense: true,
        filled: true,
        hintText: hintText,
        hintStyle: smallTextStyle?.copyWith(color: manatee),
        fillColor: fillColor ?? context.theme.appBarTheme.backgroundColor,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        contentPadding: contentPadding ?? EdgeInsets.zero,
      ),
    );
  }
}
