class AppSettings {
  final bool isDrawer;

  AppSettings({this.isDrawer = false});

  AppSettings copyWith({
    bool? isDrawer,
  }) =>
      AppSettings(isDrawer: isDrawer ?? this.isDrawer);

  Map<String, dynamic> toJson() => {
        'isDrawer': isDrawer,
      };

  factory AppSettings.fromJson(Map<String, dynamic>? json) {
    return AppSettings(
      isDrawer: json?['isDrawer'] ?? false,
    );
  }
}
