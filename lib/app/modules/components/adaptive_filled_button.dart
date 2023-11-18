import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdaptiveFilledButton extends StatelessWidget {
  const AdaptiveFilledButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.buttonColor,
    this.buttonWidth,
    this.noShadow = false,
  }) : super(key: key);
  final void Function()? onPressed;
  final Widget child;
  final Color? buttonColor;
  final double? buttonWidth;
  final bool noShadow;
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTheme(
        data: CupertinoThemeData(primaryColor: buttonColor ?? context.theme.primaryColor),
        child: SizedBox(
          width: buttonWidth,
          child: CupertinoButton.filled(
            onPressed: onPressed,
            child: child,
          ),
        ),
      );
    }
    return MaterialButton(
      /// default height is 36
      height: 45,
      minWidth: buttonWidth,
      color: buttonColor ?? context.theme.primaryColor,
      textColor: Colors.white,
      onPressed: onPressed,
      child: child,
    );
  }
}
