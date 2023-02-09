class NotificationProvider {
  String? id;
  bool isInstalled = true;

  NotificationProvider({
    required this.id,
    this.isInstalled = true,
  });

  NotificationProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isInstalled = json['is_installed'] ?? true;
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['is_installed'] = isInstalled;
    return json;
  }
}
