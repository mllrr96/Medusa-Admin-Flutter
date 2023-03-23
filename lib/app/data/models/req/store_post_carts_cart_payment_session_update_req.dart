class StorePostCartsCartPaymentSessionUpdateReqdata {
  Map<String, dynamic>? data;

  StorePostCartsCartPaymentSessionUpdateReqdata({
    required this.data,
  });

  StorePostCartsCartPaymentSessionUpdateReqdata.fromJson(
      Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!;
    }
    return data;
  }
}
