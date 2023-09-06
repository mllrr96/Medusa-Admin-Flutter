import '../../../../core/utils/enums.dart';

class AppSettings {
  final bool useAndroidPicker;
  final DateFormatOptions dateFormatOptions;
  final TimeFormatOptions timeFormatOptions;

  AppSettings({
    this.useAndroidPicker = false,
    this.dateFormatOptions = DateFormatOptions.fifth,
    this.timeFormatOptions = TimeFormatOptions.amPm,
  });

  AppSettings copyWith({
    bool? useAndroidPicker,
    DateFormatOptions? dateFormatOptions,
    TimeFormatOptions? timeFormatOptions,
  }) =>
      AppSettings(
        useAndroidPicker: useAndroidPicker ?? this.useAndroidPicker,
        timeFormatOptions: timeFormatOptions ?? this.timeFormatOptions,
        dateFormatOptions: dateFormatOptions ?? this.dateFormatOptions,
      );

  Map<String, dynamic> toJson() => {
        'useAndroidPicker': useAndroidPicker,
        'timeFormatOptions': timeFormatOptions.index,
        'dateFormatOptions': dateFormatOptions.index,
      };

  factory AppSettings.fromJson(Map<String, dynamic>? json) {
    return AppSettings(
        useAndroidPicker: json?['useAndroidPicker'] ?? false,
        timeFormatOptions:
            TimeFormatOptions.fromInt(json?['timeFormatOptions']),
        dateFormatOptions:
            DateFormatOptions.fromInt(json?['dateFormatOptions']));
  }
}
