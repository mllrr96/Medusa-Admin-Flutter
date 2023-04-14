import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(tag: 'medusa', child: Image.asset('assets/images/medusa.png', scale: 5)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text.rich(
                TextSpan(
                  style: GoogleFonts.cabin(
                    fontSize: 42,
                    letterSpacing: 2.0,
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
            ),
            const SizedBox(height: 15),
            const CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
