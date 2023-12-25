import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get instance => Get.find<ThemeController>();
  // void _loadThemeMode() {
  //   switch (appearanceMode) {
  //     case AppearanceMode.device:
  //       themeMode = ThemeMode.system;
  //       break;
  //     case AppearanceMode.light:
  //       themeMode = ThemeMode.light;
  //       break;
  //     case AppearanceMode.dark:
  //       themeMode = ThemeMode.dark;
  //       break;
  //   }
  //   // update();
  // }
  //
  // void changeTheme({required AppearanceMode appearance}) {
  //   switch (appearance) {
  //     case AppearanceMode.device:
  //       Get.changeThemeMode(ThemeMode.system);
  //       break;
  //     case AppearanceMode.light:
  //       Get.changeThemeMode(ThemeMode.light);
  //       break;
  //     case AppearanceMode.dark:
  //       Get.changeThemeMode(ThemeMode.dark);
  //       break;
  //   }
  //   appearanceMode = appearance;
  //   // update();
  // }
}
