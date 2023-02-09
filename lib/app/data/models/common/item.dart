class Item {
  String? variantId;
  int? quantity;

  Item({
    required this.variantId,
    required this.quantity,
  });

  Item.fromJson(Map<String, dynamic> json) {
    variantId = json['variant_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variant_id'] = variantId;
    data['quantity'] = quantity;
    return data;
  }
}
