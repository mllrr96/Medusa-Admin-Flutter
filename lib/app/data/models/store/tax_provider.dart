class TaxProvider {
  String? id;
  bool isInstalled = true;

  TaxProvider({
    this.id,
    this.isInstalled = true,
  });

  TaxProvider.fromJson(Map<String, dynamic> json) {
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
