import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/theme_mode_extension.dart';

import '../../../core/utils/enums.dart';

class AppPreference {
  final bool useAndroidPicker;
  final bool useMaterial3;
  final bool downloadBeta;
  final DateFormatOptions dateFormatOptions;
  final TimeFormatOptions timeFormatOptions;
  final FlexScheme colorScheme;
  final AppBarStyle appBarStyle;
  final ThemeMode themeMode;

  AppPreference({
    required this.useAndroidPicker,
    required this.useMaterial3,
    required this.downloadBeta,
    required this.dateFormatOptions,
    required this.timeFormatOptions,
    required this.colorScheme,
    required this.appBarStyle,
    required this.themeMode,
  });
  AppPreference.defaultSettings({
    this.useAndroidPicker = false,
    this.useMaterial3 = true,
    this.downloadBeta = false,
    this.themeMode = ThemeMode.system,
    this.appBarStyle = AppBarStyle.normal,
    this.dateFormatOptions = DateFormatOptions.fifth,
    this.timeFormatOptions = TimeFormatOptions.amPm,
    this.colorScheme = FlexScheme.indigo,
  });

  AppPreference copyWith({
    bool? useAndroidPicker,
    bool? useMaterial3,
    bool? downloadBeta,
    bool? useBiometric,
    DateFormatOptions? dateFormatOptions,
    AuthenticationType? authType,
    TimeFormatOptions? timeFormatOptions,
    FlexScheme? colorScheme,
    AppBarStyle? appBarStyle,
    ThemeMode? themeMode,
  }) =>
      AppPreference(
        useAndroidPicker: useAndroidPicker ?? this.useAndroidPicker,
        useMaterial3: useMaterial3 ?? this.useMaterial3,
        themeMode: themeMode ?? this.themeMode,
        appBarStyle: appBarStyle ?? this.appBarStyle,
        downloadBeta: downloadBeta ?? this.downloadBeta,
        timeFormatOptions: timeFormatOptions ?? this.timeFormatOptions,
        dateFormatOptions: dateFormatOptions ?? this.dateFormatOptions,
        colorScheme: colorScheme ?? this.colorScheme,
      );

  Map<String, dynamic> toJson() => {
        'useAndroidPicker': useAndroidPicker,
        'useMaterial3': useMaterial3,
        'downloadBeta': downloadBeta,
        'themeMode': themeMode.index,
        'appBarStyle': appBarStyle.toInt(),
        'timeFormatOptions': timeFormatOptions.index,
        'dateFormatOptions': dateFormatOptions.index,
        'colorScheme': colorScheme.name,
      };

  factory AppPreference.fromJson(Map<String, dynamic>? json) {
    return AppPreference(
        useAndroidPicker: json?['useAndroidPicker'] ?? false,
        useMaterial3: json?['useMaterial3'] ?? true,
        downloadBeta: json?['downloadBeta'] ?? false,
        themeMode: json?['themeMode'] is int
            ? (json?['themeMode'] as int).getThemeMode
            : ThemeMode.system,
        appBarStyle: AppBarStyle.fromJson(json?['appBarStyle']),
        timeFormatOptions:
            TimeFormatOptions.fromInt(json?['timeFormatOptions']),
        dateFormatOptions:
            DateFormatOptions.fromInt(json?['dateFormatOptions']),
        colorScheme: FlexScheme.values.firstWhere(
            (e) => e.name == json?['colorScheme'],
            orElse: () => FlexScheme.hippieBlue));
  }
}
