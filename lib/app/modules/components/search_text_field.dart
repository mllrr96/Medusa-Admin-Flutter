import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField(
      {Key? key,
      this.focusNode,
      required this.controller,
      this.hintText,
      this.onChanged,
      this.onSuffixTap,
      this.suffixIcon,
      this.adnroidPadding})
      : super(key: key);
  final FocusNode? focusNode;
  final TextEditingController controller;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function()? onSuffixTap;
  final Icon? suffixIcon;
  final EdgeInsets? adnroidPadding;
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
    if (Platform.isIOS) {
      return CupertinoSearchTextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        placeholder: widget.hintText,
        onChanged: widget.onChanged,
        onSuffixTap: widget.onSuffixTap,
        suffixIcon: widget.suffixIcon ?? const Icon(CupertinoIcons.xmark_circle_fill),
      );
    }
    final bool empty = widget.controller.text.removeAllWhitespace.isEmpty;
    const outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)), borderSide: BorderSide(color: Colors.grey));

    return TextFormField(
      style: Theme.of(context).textTheme.titleSmall,
      controller: widget.controller,
      focusNode: widget.focusNode,
      autocorrect: false,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(maxHeight: 40, maxWidth: 40),
        suffixIcon: empty
            ? null
            : IconButton(
          padding: EdgeInsets.zero,
          icon: widget.suffixIcon ?? const Icon(Icons.clear,),
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
