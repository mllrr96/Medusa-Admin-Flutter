import 'index.dart';


class LineItemAdjustment {
  String? id;
  String? itemId;
  LineItem? item;
  String? description;
  String? discountId;
  Discount? discount;
  num? amount;
  Map<String, dynamic> metadata = <String, dynamic>{};

  LineItemAdjustment({
    this.id,
    required this.itemId,
    this.item,
    required this.description,
    this.discountId,
    this.discount,
    required this.amount,
    this.metadata = const {},
  });

  LineItemAdjustment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    item = json['item'] != null ? LineItem.fromJson(json['item']) : null;
    description = json['description'];
    discountId = json['discount_id'];
    discount =
        json['discount'] != null ? Discount.fromJson(json['discount']) : null;
    amount = json['amount'];
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['item_id'] = itemId;
    json['item'] = item?.toJson();
    json['description'] = description;
    json['discount_id'] = discountId;
    json['amount'] = amount;
    json['metadata'] = metadata;
    return json;
  }
}
