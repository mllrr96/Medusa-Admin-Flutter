import 'package:flex_color_scheme/flex_color_scheme.dart';

import '../../../core/utils/enums.dart';

class AppPreference {
  final bool useAndroidPicker;
  final bool useMaterial3;
  final bool downloadBeta;
  final DateFormatOptions dateFormatOptions;
  final TimeFormatOptions timeFormatOptions;
  final FlexScheme colorScheme;
  final AppBarStyle appBarStyle;

  AppPreference({
    required this.useAndroidPicker,
    required this.useMaterial3,
    required this.downloadBeta,
    required this.dateFormatOptions,
    required this.timeFormatOptions,
    required this.colorScheme,
    required this.appBarStyle,
  });
  AppPreference.defaultSettings({
    this.useAndroidPicker = false,
    this.useMaterial3 = true,
    this.downloadBeta = false,
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
  }) =>
      AppPreference(
        useAndroidPicker: useAndroidPicker ?? this.useAndroidPicker,
        useMaterial3: useMaterial3 ?? this.useMaterial3,
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

