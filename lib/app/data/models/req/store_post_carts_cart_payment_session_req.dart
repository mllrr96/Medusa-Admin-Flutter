class StorePostCartsCartPaymentSessionReq {
  String? providerId;

  StorePostCartsCartPaymentSessionReq({
    required this.providerId,
  });

  StorePostCartsCartPaymentSessionReq.fromJson(Map<String, dynamic> json) {
    providerId = json['provider_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['provider_id'] = providerId;
    return data;
  }
}
