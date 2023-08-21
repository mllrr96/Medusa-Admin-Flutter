class AppSettings {
  final bool useAndroidPicker;
  final bool showShakeSearchWarning;
  final bool shakeTOSearch;

  AppSettings(
      {this.useAndroidPicker = false,
      this.showShakeSearchWarning = true,
      this.shakeTOSearch = true});

  AppSettings copyWith({
    bool? useAndroidPicker,
    bool? showShakeSearchWarning,
    bool? shakeTOSearch,
  }) =>
      AppSettings(
        useAndroidPicker: useAndroidPicker ?? this.useAndroidPicker,
        showShakeSearchWarning:
            showShakeSearchWarning ?? this.showShakeSearchWarning,
        shakeTOSearch: shakeTOSearch ?? this.shakeTOSearch,
      );

  Map<String, dynamic> toJson() => {
        'useAndroidPicker': useAndroidPicker,
        'showShakeSearchWarning': showShakeSearchWarning,
        'shakeTOSearch': shakeTOSearch,
      };

  factory AppSettings.fromJson(Map<String, dynamic>? json) {
    return AppSettings(
      useAndroidPicker: json?['useAndroidPicker'] ?? false,
      showShakeSearchWarning: json?['showShakeSearchWarning'] ?? true,
      shakeTOSearch: json?['shakeTOSearch'] ?? true,
    );
  }
}
