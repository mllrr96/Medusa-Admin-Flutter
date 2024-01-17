import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

extension SettingsThemeDataContextEntension<T> on BuildContext {
// settings list theme
// ===================================================================//
  SettingsThemeData get settingsListLightTheme => SettingsThemeData(
        settingsListBackground: Theme.of(this).scaffoldBackgroundColor,
        settingsSectionBackground: Theme.of(this).scaffoldBackgroundColor,
        titleTextColor: Theme.of(this).colorScheme.secondary,
      );

  SettingsThemeData get settingsListDarkTheme => SettingsThemeData(
        settingsListBackground: Theme.of(this).scaffoldBackgroundColor,
        settingsSectionBackground: Theme.of(this).scaffoldBackgroundColor,
        titleTextColor: Theme.of(this).colorScheme.secondary,
      );
}
