class StorePostCartsCartPaymentSessionReq {
  String? providerId;

  StorePostCartsCartPaymentSessionReq({
    required this.providerId,
  });

  StorePostCartsCartPaymentSessionReq.fromJson(Map<String, dynamic> json) {
    providerId = json['provider_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider_id'] = this.providerId;
    return data;
  }
}
