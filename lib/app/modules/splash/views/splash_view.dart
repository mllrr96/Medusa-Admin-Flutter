import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: ColorManager.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 42,
                  color: Colors.white,
                  letterSpacing: 1.999999953855673,
                ),
                children: const [
                  TextSpan(
                    text: 'Medusa',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: ' Admin',
                    style: TextStyle(
                      color: Color(0xFFFE9879),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            CircularProgressIndicator.adaptive(
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: GetPlatform.isIOS ? CupertinoColors.white : null,
            ),
          ],
        ),
      ),
    );
  }
}
