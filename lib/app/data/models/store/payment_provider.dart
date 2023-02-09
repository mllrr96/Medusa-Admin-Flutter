class PaymentProvider {
  String? id;
  bool isInstalled = true;

  PaymentProvider({
    required this.id,
    this.isInstalled = true,
  });

  PaymentProvider.fromJson(Map<String, dynamic> json) {
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
