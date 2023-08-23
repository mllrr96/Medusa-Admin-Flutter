import 'index.dart';


class LineItemTaxLine {
  String? id;
  String? itemId;
  LineItem? item;
  String? code;
  String? name;
  num? rate;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  LineItemTaxLine({
    this.id,
    required this.itemId,
    this.item,
    this.code,
    required this.name,
    required this.rate,
    this.createdAt,
    this.updatedAt,
    this.metadata = const {},
  });

  LineItemTaxLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    item = json['item'] != null ? LineItem.fromJson(json['item']) : null;
    code = json['code'];
    name = json['name'];
    rate = json['rate'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['item_id'] = itemId;
    json['item'] = item?.toJson();
    json['code'] = code;
    json['name'] = name;
    json['rate'] = rate;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
