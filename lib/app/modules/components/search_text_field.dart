import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/medusa_icons_icons.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField(
      {Key? key,
      this.focusNode,
      required this.controller,
      this.hintText,
      this.onChanged,
      this.onSuffixTap,
      this.suffixIcon,
      this.androidPadding,
      this.oldStyle = false,
      this.fillColor,
      this.onSubmitted})
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
  final bool oldStyle;
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  void initState() {
    // TODO: I'm not sure it's a good idea to set state like that, check performance on android
    if (Platform.isAndroid) {
      widget.controller.addListener(() {
        setState(() {});
      });
    }

    super.initState();
  }

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
    if (!widget.oldStyle) {
      return TextField(
        controller: widget.controller,
        style: smallTextStyle,
        autocorrect: false,
        textInputAction: TextInputAction.search,
        onSubmitted: widget.onSubmitted,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          suffixIconConstraints: constraints,
          suffixIcon: Material(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            color:
                widget.fillColor ?? context.theme.appBarTheme.backgroundColor,
            child: InkWell(
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(4.0)),
              onTap: widget.onSuffixTap,
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
              Hero(
                  tag: 'search',
                  child: Icon(MedusaIcons.magnifying_glass_mini,
                      color: lightWhite)),
              const SizedBox(width: 12.0),
            ],
          ),
          isDense: true,
          filled: true,
          hintText: widget.hintText,
          hintStyle: smallTextStyle?.copyWith(color: lightWhite),
          fillColor:
              widget.fillColor ?? context.theme.appBarTheme.backgroundColor,
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          contentPadding: EdgeInsets.zero,
        ),
      );
    }

    if (Platform.isIOS) {
      return CupertinoSearchTextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        placeholder: widget.hintText,
        onChanged: widget.onChanged,
        onSuffixTap: widget.onSuffixTap,
        suffixIcon:
            widget.suffixIcon ?? const Icon(CupertinoIcons.xmark_circle_fill),
      );
    }
    final bool empty = widget.controller.text.removeAllWhitespace.isEmpty;
    const outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        borderSide: BorderSide(color: Colors.grey));

    return TextFormField(
      style: Theme.of(context).textTheme.titleSmall,
      controller: widget.controller,
      focusNode: widget.focusNode,
      autocorrect: false,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        suffixIconConstraints:
            const BoxConstraints(maxHeight: 40, maxWidth: 40),
        suffixIcon: empty
            ? null
            : IconButton(
                padding: EdgeInsets.zero,
                icon: widget.suffixIcon ??
                    const Icon(
                      Icons.clear,
                    ),
                onPressed: widget.onSuffixTap ??
                    () {
                      setState(() {
                        widget.controller.clear();
                      });
                    },
              ),
        isDense: true,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
        hintText: widget.hintText,
      ),
      onChanged: widget.onChanged,
    );
  }
}
