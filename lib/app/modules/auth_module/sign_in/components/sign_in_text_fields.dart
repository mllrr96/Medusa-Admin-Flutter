import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);
  final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Container(
      alignment: Alignment.center,
      height: size.height / 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //lock logo here
            // Icon(
            //   obscureText ? Icons.lock : Icons.lock_open,
            //   color: Get.isDarkMode ? Colors.white70 : Colors.black54,
            // ),
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, anim) => FadeTransition(
                      opacity: child.key == const ValueKey('icon1')
                          ? Tween<double>(begin: 1, end: 1).animate(anim)
                          : Tween<double>(begin: 1, end: 1).animate(anim),
                      child: FadeTransition(opacity: anim, child: child),
                    ),
                child: obscureText
                    ? Icon(Icons.lock,
                        key: const ValueKey('icon1'), color: Get.isDarkMode ? Colors.white70 : Colors.black54)
                    : Icon(
                        Icons.lock_open,
                        color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                        key: const ValueKey('icon2'),
                      )),
            const SizedBox(
              width: 16,
            ),
            SvgPicture.string(
              '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 1.0,
              height: 15.5,
              colorFilter: ColorFilter.mode(lightWhite, BlendMode.color),
            ),
            const SizedBox(
              width: 16,
            ),
            //password textField
            Expanded(
              child: TextField(
                maxLines: 1,
                controller: widget.controller,
                cursorColor: Get.isDarkMode ? Colors.white70 : Colors.black54,
                keyboardType: TextInputType.visiblePassword,
                onChanged: widget.onChanged,
                obscureText: obscureText,
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                    filled: false,
                    hintText: 'Enter your password',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: AdaptiveIcon(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                        )),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required this.controller,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Container(
      alignment: Alignment.center,
      height: size.height / 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //mail icon
            Icon(
              Icons.mail,
              color: Get.isDarkMode ? Colors.white70 : Colors.black54,
            ),
            const SizedBox(
              width: 16,
            ),
            //divider svg
            SvgPicture.string(
              '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 1.0,
              height: 15.5,
              colorFilter: ColorFilter.mode(lightWhite, BlendMode.color),
            ),
            const SizedBox(
              width: 16,
            ),
            //email address textField
            Expanded(
              child: TextField(
                maxLines: 1,
                controller: controller,
                cursorColor: Get.isDarkMode ? Colors.white70 : Colors.blueGrey,
                keyboardType: TextInputType.emailAddress,
                textInputAction: textInputAction,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    filled: false,
                    hintText: 'Enter your email address',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
