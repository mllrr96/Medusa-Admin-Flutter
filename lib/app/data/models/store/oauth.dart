class OAuth {
  String? id;
  String? displayName;
  String? applicationName;
  String? installUrl;
  String? unInstallUrl;
  Map<String, dynamic>? data;

  OAuth({
    required this.id,
    required this.displayName,
    required this.applicationName,
    this.installUrl,
    this.unInstallUrl,
    this.data,
  });

  OAuth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    applicationName = json['application_name'];
    installUrl = json['install_url'];
    unInstallUrl = json['uninstall_url'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['display_name'] = displayName;
    json['application_name'] = applicationName;
    json['install_url'] = installUrl;
    json['uninstall_url'] = unInstallUrl;
    json['data'] = data;
    return json;
  }
}
