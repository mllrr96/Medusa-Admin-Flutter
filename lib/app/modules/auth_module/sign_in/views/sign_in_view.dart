import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/language_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/error_widget.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import '../components/sign_in_components.dart';
import '../controllers/sign_in_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final translate = AppLocalizations.of(context)!;
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;
    // Since there no app bar, annotated region is used to apply theme ui overlay
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).appBarTheme.systemOverlayStyle!,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Obx(() {
                    return Hero(
                      tag: 'closeReset',
                      child: AdaptiveIcon(
                        onPressed: () async =>
                            await controller.changeThemeMode(),
                        icon: Icon(themeIcon(controller.themeMode.value)),
                      ),
                    );
                  }),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                          tag: 'medusa',
                          child: Image.asset('assets/images/medusa.png',
                              scale: 5)),
                      Column(
                        children: [
                          Text(translate.welcome,
                              style: Theme.of(context).textTheme.displayLarge),
                          Text(
                            translate.greatToSeeYou,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            translate.loginBelow,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      GestureDetector(
                        onTap: () => controller.errorMessage.value = '',
                        child: errorMessage(
                          errorMessage: controller.errorMessage,
                          context: context,
                          emptyChildHeight: 0,
                          horizontalPadding: 12.0,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            Hero(
                                tag: 'email',
                                child: EmailTextField(
                                    controller: controller.emailCtrl)),
                            const SizedBox(height: 12.0),
                            PasswordTextField(
                                controller: controller.passwordCtrl),
                          ],
                        ),
                      ),
                      Align(
                        alignment: isRTL
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: AdaptiveButton(
                          child: Text(
                            translate.resetPassword,
                          ),
                          onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Hero(
                        tag: 'continue',
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: SignInButton(
                            onPressed: () async =>
                                await controller.signIn(context),
                            label: translate.cont,
                            buttonWidth: double.maxFinite,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SignInButton(
                          onPressed: () async {
                            await LanguageService.instance.changeLanguage();
                          },
                          label: LanguageService.instance.language,
                          buttonWidth: double.maxFinite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData themeIcon(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return Icons.brightness_auto;
      case ThemeMode.light:
        return MedusaIcons.sun;
      case ThemeMode.dark:
        return MedusaIcons.moon;
    }
  }
}
