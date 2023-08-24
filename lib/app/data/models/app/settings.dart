import '../../../../core/utils/enums.dart';

class AppSettings {
  final bool useAndroidPicker;
  final bool showShakeSearchWarning;
  final bool shakeToSearch;
  final DateFormatOptions dateFormatOptions;
  final TimeFormatOptions timeFormatOptions;

  AppSettings({
    this.useAndroidPicker = false,
    this.showShakeSearchWarning = true,
    this.shakeToSearch = false,
    this.dateFormatOptions = DateFormatOptions.fifth,
    this.timeFormatOptions = TimeFormatOptions.amPm,
  });

  AppSettings copyWith({
    bool? useAndroidPicker,
    bool? showShakeSearchWarning,
    bool? shakeToSearch,
    DateFormatOptions? dateFormatOptions,
    TimeFormatOptions? timeFormatOptions,
  }) =>
      AppSettings(
        useAndroidPicker: useAndroidPicker ?? this.useAndroidPicker,
        showShakeSearchWarning:
            showShakeSearchWarning ?? this.showShakeSearchWarning,
        shakeToSearch: shakeToSearch ?? this.shakeToSearch,
        timeFormatOptions: timeFormatOptions ?? this.timeFormatOptions,
        dateFormatOptions: dateFormatOptions ?? this.dateFormatOptions,
      );

  Map<String, dynamic> toJson() => {
        'useAndroidPicker': useAndroidPicker,
        'showShakeSearchWarning': showShakeSearchWarning,
        'shakeToSearch': shakeToSearch,
        'timeFormatOptions': timeFormatOptions.index,
        'dateFormatOptions': dateFormatOptions.index,
      };

  factory AppSettings.fromJson(Map<String, dynamic>? json) {
    return AppSettings(
        useAndroidPicker: json?['useAndroidPicker'] ?? false,
        showShakeSearchWarning: json?['showShakeSearchWarning'] ?? true,
        shakeToSearch: json?['shakeToSearch'] ?? true,
        timeFormatOptions:
            TimeFormatOptions.fromInt(json?['timeFormatOptions']),
        dateFormatOptions:
            DateFormatOptions.fromInt(json?['dateFormatOptions']));
  }
}
