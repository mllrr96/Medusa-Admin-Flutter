import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/medusa_icons_icons.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {Key? key,
      this.focusNode,
      required this.controller,
      this.hintText,
      this.onChanged,
      this.onSuffixTap,
      this.suffixIcon,
      this.androidPadding,
      this.fillColor,
      this.onSubmitted,  this.autoFocus = false,
      })
      : super(key: key);
  final FocusNode? focusNode;
  final TextEditingController controller;
  final String? hintText;
  final Color? fillColor;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onSuffixTap;
  final Icon? suffixIcon;
  final EdgeInsets? androidPadding;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const constraints = BoxConstraints(minWidth: 30.0, minHeight: 40);
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
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
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        suffixIconConstraints: constraints,
        suffixIcon: Material(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          color:
          fillColor ?? context.theme.appBarTheme.backgroundColor,
          child: InkWell(
            borderRadius: const BorderRadius.horizontal(right: Radius.circular(4.0)),
            onTap: onSuffixTap,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.xmark_circle_fill),
            ),
          ),
        ),
        prefixIconConstraints: constraints,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 12.0),
            Icon(MedusaIcons.magnifying_glass_mini,
                color: lightWhite),
            const SizedBox(width: 12.0),
          ],
        ),
        isDense: true,
        filled: true,
        hintText: hintText,
        hintStyle: smallTextStyle?.copyWith(color: lightWhite),
        fillColor:
        fillColor ?? context.theme.appBarTheme.backgroundColor,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
