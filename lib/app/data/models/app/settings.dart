import '../../../../core/utils/enums.dart';

class AppSettings {
  final bool useAndroidPicker;
  final bool showShakeSearchWarning;
  final bool shakeTOSearch;
  final DateFormatOptions dateFormatOptions;
  final TimeFormatOptions timeFormatOptions;

  AppSettings({
    this.useAndroidPicker = false,
    this.showShakeSearchWarning = true,
    this.shakeTOSearch = true,
    this.dateFormatOptions = DateFormatOptions.fifth,
    this.timeFormatOptions = TimeFormatOptions.amPm,
  });

  AppSettings copyWith({
    bool? useAndroidPicker,
    bool? showShakeSearchWarning,
    bool? shakeTOSearch,
    DateFormatOptions? dateFormatOptions,
    TimeFormatOptions? timeFormatOptions,
  }) =>
      AppSettings(
        useAndroidPicker: useAndroidPicker ?? this.useAndroidPicker,
        showShakeSearchWarning:
            showShakeSearchWarning ?? this.showShakeSearchWarning,
        shakeTOSearch: shakeTOSearch ?? this.shakeTOSearch,
        timeFormatOptions: timeFormatOptions ?? this.timeFormatOptions,
        dateFormatOptions: dateFormatOptions ?? this.dateFormatOptions,
      );

  Map<String, dynamic> toJson() => {
        'useAndroidPicker': useAndroidPicker,
        'showShakeSearchWarning': showShakeSearchWarning,
        'shakeTOSearch': shakeTOSearch,
        'timeFormatOptions': timeFormatOptions.index,
        'dateFormatOptions': dateFormatOptions.index,
      };

  factory AppSettings.fromJson(Map<String, dynamic>? json) {
    return AppSettings(
        useAndroidPicker: json?['useAndroidPicker'] ?? false,
        showShakeSearchWarning: json?['showShakeSearchWarning'] ?? true,
        shakeTOSearch: json?['shakeTOSearch'] ?? true,
        timeFormatOptions: json?['timeFormatOptions'] ?? TimeFormatOptions.amPm,
        dateFormatOptions:
            json?['dateFormatOptions'] ?? DateFormatOptions.fifth);
  }
}
