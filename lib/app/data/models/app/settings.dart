class AppSettings {
  final bool useAndroidPicker;

  AppSettings({this.useAndroidPicker = false});

  AppSettings copyWith({
    bool? useAndroidPicker,
  }) =>
      AppSettings(useAndroidPicker: useAndroidPicker ?? this.useAndroidPicker);

  Map<String, dynamic> toJson() => {
        'useAndroidPicker': useAndroidPicker,
      };

  factory AppSettings.fromJson(Map<String, dynamic>? json) {
    return AppSettings(
      useAndroidPicker: json?['useAndroidPicker'] ?? false,
    );
  }
}
