
import 'package:medusa_admin/app/data/models/store/region.dart';

import 'order.dart';

class GiftCard {
  String? id;
  String? code;
  int? value;
  int? balance;
  String? regionId;
  Region? region;
  String? orderId;
  Order? order;
  bool? isDisabled;
  DateTime? endsAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  GiftCard({
    this.id,
    required this.code,
    required this.value,
    required this.balance,
    required this.regionId,
    this.region,
    this.orderId,
    this.order,
    this.isDisabled,
    this.endsAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const {},
  });

  GiftCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    value = json['value'];
    balance = json['balance'];
    regionId = json['region_id'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    isDisabled = json['is_disabled'];
    endsAt = DateTime.tryParse(json['ends_at'] ?? '');
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['code'] = code;
    json['value'] = value;
    json['balance'] = balance;
    json['region_id'] = regionId;
    json['region'] = region?.toJson() ?? {};
    json['order_id'] = orderId;
    json['order'] = order?.toJson() ?? {};
    json['is_disabled'] = isDisabled;
    json['ends_at'] = endsAt.toString();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
