class StorePostCartsCartShippingMethodReq {
  String? optionId;
  Map<String, dynamic>? data;

  StorePostCartsCartShippingMethodReq({
    required this.optionId,
    this.data,
  });

  StorePostCartsCartShippingMethodReq.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['option_id'] = optionId;
    if (this.data != null) {
      data['data'] = this.data!;
    }
    return data;
  }
}
