import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/modules/components/date_time_card.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import '../../../../core/utils/medusa_icons_icons.dart';
import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final bottomPadding = context.mediaQueryViewPadding.bottom;
    final storageService = StorageService.instance;
    final appSettings = StorageService.appSettings;
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;
    const space = SizedBox(height: 12.0);
    // const halfSpace = SizedBox(height: 6.0);
    final pageDecoration = PageDecoration(
      titleTextStyle: largeTextStyle!,
      bodyTextStyle: mediumTextStyle!,
      bodyPadding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
      titlePadding: EdgeInsets.only(top: context.mediaQueryPadding.top),
      footerFit: FlexFit.tight,
      footerFlex: 0,
      pageColor: context.theme.scaffoldBackgroundColor,
      imagePadding: EdgeInsets.zero,
    );

    void onDone() {
      storageService.updateAppSettings(appSettings.copyWith(showIntroView: false));
      Get.offAllNamed(Routes.SIGN_IN);
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).appBarTheme.systemOverlayStyle!,
      child: IntroductionScreen(
        done: const Text('Done'),
        next: const Text('Next'),
        skip: const Text('Skip'),
        rtl: isRTL,
        onSkip: onDone,
        showSkipButton: true,
        controlsMargin: EdgeInsets.only(bottom: bottomPadding == 0 ? 30 : bottomPadding),
        onDone: onDone,
        pages: [
          PageViewModel(
            title: "Medusa Admin Onboarding",
            // body: "Instead of having to buy an entire share, invest any amount you want.",
            decoration: pageDecoration,
            bodyWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/medusa.png'),
                Text(
                  'Manage your MedusaJs store from your mobile device',
                  style: mediumTextStyle.copyWith(color: lightWhite),
                )
              ],
            ),
          ),
          PageViewModel(
              title: "Customize your app",
              bodyWidget: Column(
                children: [
                  const Divider(),
                  Text('Light preferences', style: smallTextStyle?.copyWith(color: lightWhite)),
                  space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.brightness_auto),
                        iconSize: 28,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(MedusaIcons.sun),
                        iconSize: 28,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(MedusaIcons.moon),
                        iconSize: 28,
                      ),
                    ],
                  ),
                  space,
                  space,
                  Text('Date & Time format', style: smallTextStyle?.copyWith(color: lightWhite)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(onPressed: () {}, child: Text(formatDate(DateTime.now()))),
                      TextButton(onPressed: () {}, child: Text(formatTime(DateTime.now()))),
                    ],
                  ),
                ],
              ),
              decoration: pageDecoration,
              footer: Column(
                children: [
                  const SizedBox(height: 6.0),
                  Text(
                    'You can always change app settings later',
                    style: smallTextStyle?.copyWith(color: lightWhite),
                  ),
                ],
              )),
          PageViewModel(
            title: "Medusa Admin Onboarding",
            // body: "Instead of having to buy an entire share, invest any amount you want.",
            decoration: pageDecoration,
            bodyWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/medusa.png'),
                Text(
                  'Manage your MedusaJs store from your mobile device',
                  style: mediumTextStyle.copyWith(color: lightWhite),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
