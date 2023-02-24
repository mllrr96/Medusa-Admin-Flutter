import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({Key? key, required this.onPressed, required this.child}) : super(key: key);
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(onPressed: onPressed, child: child);
    } else {
      return TextButton(onPressed: onPressed, child: child);
    }
  }
}
