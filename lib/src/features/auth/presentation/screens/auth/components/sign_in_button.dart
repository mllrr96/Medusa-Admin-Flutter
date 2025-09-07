import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.textStyle,
    this.textColor,
    this.buttonColor,
    this.buttonWidth,
    this.noShadow = false,
  });
  final void Function()? onPressed;
  final String label;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? buttonColor;
  final double? buttonWidth;
  final bool noShadow;
  @override
  Widget build(BuildContext context) {
    final TextStyle filledTextStyle = GoogleFonts.aBeeZee(
        fontSize: 16.0, color: textColor ?? ColorManager.white);
    if (Platform.isIOS) {
      return CupertinoTheme(
        data: CupertinoThemeData(
            primaryColor: buttonColor ?? Theme.of(context).primaryColor),
        child: SizedBox(
          width: buttonWidth,
          child: CupertinoButton.filled(
            onPressed: onPressed,
            child: Text(
              label,
              style: textStyle ?? filledTextStyle,
            ),
          ),
        ),
      );
    }
    return MaterialButton(
      // default height is 36
      height: 45,
      minWidth: buttonWidth,
      color: buttonColor ?? Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle ?? filledTextStyle,
      ),
    );
  }
}
