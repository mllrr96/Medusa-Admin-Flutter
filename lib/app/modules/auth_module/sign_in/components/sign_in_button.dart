import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/colors.dart';


class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.onPress,
    required this.label,
    this.textStyle,
    this.textColor,
    this.buttonColor,
    this.buttonWidth,
    this.noShadow = false,
  }) : super(key: key);
  final void Function()? onPress;
  final String label;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? buttonColor;
  final double? buttonWidth;
  final bool noShadow;
  @override
  Widget build(BuildContext context) {
    final TextStyle filledTextStyle = GoogleFonts.aBeeZee(fontSize: 16.0, color: textColor ?? ColorManager.white);
    if (GetPlatform.isIOS) {
      return CupertinoTheme(
        data: CupertinoThemeData(primaryColor: buttonColor ?? Theme.of(context).primaryColor),
        child: SizedBox(
          width: buttonWidth,
          child: CupertinoButton.filled(
            onPressed: onPress,
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
      minWidth: buttonWidth ,
      color: buttonColor ?? Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: onPress,
      child: Text(
        label,
        style: textStyle ?? filledTextStyle,
      ),
    );
  }
}
