import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AdaptiveIcon extends StatelessWidget {
  const AdaptiveIcon(
      {Key? key,
      required this.onPressed,
      required this.icon,
      this.iosPadding = const EdgeInsets.symmetric(horizontal: 12.0),
      this.androidPadding})
      : super(key: key);
  final void Function()? onPressed;
  final Widget icon;
  final EdgeInsetsGeometry? iosPadding;

  /// The padding around the button's icon. The entire padded icon will react to input gestures.
  /// This property can be null. If null, it defaults to 8.0 padding on all sides.
  final EdgeInsetsGeometry? androidPadding;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTheme(
          data: CupertinoThemeData(primaryColor: Theme.of(context).iconTheme.color),
          child: CupertinoButton(onPressed: onPressed, padding: iosPadding, child: icon));
    } else {
      return IconButton(
        onPressed: onPressed,
        icon: icon,
        padding: androidPadding,
      );
    }
  }
}
