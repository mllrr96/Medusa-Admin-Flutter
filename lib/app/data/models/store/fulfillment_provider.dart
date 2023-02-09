class FulfillmentProvider {
  String? id;
  bool? isInstalled;

  FulfillmentProvider({
    this.id,
    this.isInstalled,
  });

  FulfillmentProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isInstalled = json['is_installed'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['is_installed'] = isInstalled;
    return json;
  }
}
