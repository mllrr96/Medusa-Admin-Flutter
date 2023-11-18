import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/colors.dart';

class BottomNavigationBarButton extends StatelessWidget {
  const BottomNavigationBarButton({
    Key? key,
    required this.onPress,
    required this.label,
    this.textStyle,
    this.textColor,
    this.backgroundColor,
    this.buttonColor,
    this.buttonWidth,
    this.noShadow = false,
    this.containerHeight,
  }) : super(key: key);
  final void Function()? onPress;
  final String label;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? buttonColor;
  final double? buttonWidth;
  final double? containerHeight;
  final bool noShadow;
  @override
  Widget build(BuildContext context) {
    final TextStyle filledTextStyle = GoogleFonts.aBeeZee(fontSize: 16.0, color: textColor ?? ColorManager.white);
    const EdgeInsets kBackgroundButtonPadding = EdgeInsets.symmetric(vertical: 14.0, horizontal: 64.0);
    const double kContainerHeight = 50.0;
    // final BoxShadow boxShadow = BoxShadow(
    //   color: Colors.grey.withOpacity(0.5),
    //   spreadRadius: 3,
    //   blurRadius: 7,
    //   offset: const Offset(0, 0),
    // );
    if (GetPlatform.isIOS) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(color: backgroundColor ?? context.theme.bottomNavigationBarTheme.backgroundColor, height: MediaQuery.of(context).padding.bottom / 2),
          Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? context.theme.bottomNavigationBarTheme.backgroundColor,
              // boxShadow: noShadow ? null : [boxShadow],
            ),
            height: containerHeight ?? kContainerHeight,
            alignment: Alignment.center,
            child: CupertinoTheme(
              data: CupertinoThemeData(primaryColor: buttonColor ?? ColorManager.primary),
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
            ),
          ),
          Container(color: backgroundColor ?? context.theme.bottomNavigationBarTheme.backgroundColor, height: MediaQuery.of(context).padding.bottom),
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(color: backgroundColor ??Theme.of(context).bottomNavigationBarTheme.backgroundColor, height: MediaQuery.of(context).padding.bottom / 2),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            // boxShadow:noShadow ? null : [boxShadow],
          ),
          height: containerHeight ?? kContainerHeight,
          alignment: Alignment.center,
          child: MaterialButton(
            padding: kBackgroundButtonPadding,
            minWidth: buttonWidth,
            color: buttonColor ?? Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: onPress,
            child: Text(
              label,
              style: textStyle ?? filledTextStyle,
            ),
          ),
        ),
        Container(color: backgroundColor ?? Theme.of(context).bottomNavigationBarTheme.backgroundColor, height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}
