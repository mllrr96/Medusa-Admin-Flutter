import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Medusa Admin';
  static const String firstRun = 'firstRun';
  static const String appSettingsKey = 'appSettings';
  static const String orderSettingsKey = 'orderSettings';
  static const String cookieKey = 'Cookie';
  static const String themeModeKey = 'theme';
  static const String baseUrlKey = 'api';
  static const String languageKey = 'language';
  static const String useAndroidPickerKey = 'useAndroidPicker';
  static const String searchHistoryKey = 'searchHistory';
  static const String svgDivider =
      '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

  static String title(BuildContext context) =>
      (context as Element).findAncestorWidgetOfExactType<MaterialApp>()!.title;



  static const String flutterVersion = 'stable 3.16.5';
  static const String copyright = '© 2020 - 2023';
  static const String author = 'Mohammed Ragheb';
  static const String license = 'MIT License';
  static final Uri packageUri = Uri(
    scheme: 'https',
    host: 'pub.dev',
    path: 'packages/flex_color_scheme',
  );

  // Change this to your backend url, make sure to add "/admin" to the url
  // Example https://medusa-backend.app/admin
  static const String baseUrl = 'https://medusa-j2t9.onrender.com/admin';
}