import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({Key? key, required this.onPressed, required this.child, this.iosPadding}) : super(key: key);
  final void Function()? onPressed;
  final Widget child;
  final EdgeInsetsGeometry? iosPadding;
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(onPressed: onPressed,padding: iosPadding, child: child

      );
    } else {
      return TextButton(onPressed: onPressed, child: child);
    }
  }
}
