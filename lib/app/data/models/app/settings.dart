import '../../../../core/utils/enums.dart';

class AppSettings {
  final bool useAndroidPicker;
  final DateFormatOptions dateFormatOptions;
  final TimeFormatOptions timeFormatOptions;
  final bool showIntroView;

  AppSettings({
    required this.useAndroidPicker,
    required this.dateFormatOptions,
    required this.timeFormatOptions,
    required this.showIntroView,
  });

  AppSettings.defaultSettings({
    this.useAndroidPicker = false,
    this.dateFormatOptions = DateFormatOptions.fifth,
    this.timeFormatOptions = TimeFormatOptions.amPm,
    this.showIntroView = false,
  });

  AppSettings copyWith({
    bool? useAndroidPicker,
    DateFormatOptions? dateFormatOptions,
    TimeFormatOptions? timeFormatOptions,
    bool? showIntroView,
  }) =>
      AppSettings(
        useAndroidPicker: useAndroidPicker ?? this.useAndroidPicker,
        timeFormatOptions: timeFormatOptions ?? this.timeFormatOptions,
        dateFormatOptions: dateFormatOptions ?? this.dateFormatOptions,
        showIntroView: showIntroView ?? this.showIntroView,
      );

  Map<String, dynamic> toJson() => {
        'useAndroidPicker': useAndroidPicker,
        'timeFormatOptions': timeFormatOptions.index,
        'dateFormatOptions': dateFormatOptions.index,
        'showIntroView': showIntroView,
      };

  factory AppSettings.fromJson(Map<String, dynamic>? json) {
    return AppSettings(
      useAndroidPicker: json?['useAndroidPicker'] ?? false,
      timeFormatOptions: TimeFormatOptions.fromInt(json?['timeFormatOptions']),
      dateFormatOptions: DateFormatOptions.fromInt(json?['dateFormatOptions']),
      showIntroView: json?['showIntroView'] ?? true,
    );
  }
}
