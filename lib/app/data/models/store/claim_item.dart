import 'package:medusa_admin/app/data/models/store/product_variant.dart';

import 'claim_image.dart';
import 'claim_order.dart';
import 'claim_tag.dart';
import 'line_item.dart';

class ClaimItem {
  String? id;
  List<ClaimImage>? images;
  String? claimOrderId;
  ClaimOrder? claimOrder;
  String? itemId;
  LineItem? item;
  String? variantId;
  ClaimReason? reason;
  ProductVariant? variant;
  String? note;
  int? quantity;
  List<ClaimTag>? tags;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic>? metadata;

  ClaimItem({
    this.id,
    this.images,
    required this.claimOrderId,
    this.claimOrder,
    required this.itemId,
    this.item,
    required this.variantId,
    this.variant,
    required this.reason,
    this.note,
    required this.quantity,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  ClaimItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['images'] != null) {
      images = <ClaimImage>[];
      json['images'].forEach((e) => images!.add(ClaimImage.fromJson(e)));
    }
    claimOrderId = json['claim_order_id'];
    claimOrder = json['claim_order'] != null ? ClaimOrder.fromJson(json['claim_order']) : null;
    itemId = json['item_id'];
    item = json['item'] != null ? LineItem.fromJson(json['item']) : null;
    variantId = json['variant_id'];
    variant = json['variant'] != null ? ProductVariant.fromJson(json['item']) : null;
    reason = json['reason'] != null ? ClaimReason.values.firstWhere((e) => e.value == json['reason']) : null;
    note = json['note'];
    quantity = json['quantity'];
    if (json['tags'] != null) {
      tags = <ClaimTag>[];
      json['tags'].forEach((e) => tags!.add(ClaimTag.fromJson(e)));
    }
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['images'] = images?.map((e) => e.toJson()).toList();
    json['claim_order_id'] = claimOrderId;
    json['claim_order'] = claimOrder?.toJson();
    json['item_id'] = itemId;
    json['item'] = item?.toJson();
    json['variant_id'] = variantId;
    json['variant'] = variant?.toJson();
    json['reason'] = reason?.value;
    json['note'] = note;
    json['tags'] = tags?.map((e) => e.toJson()).toList();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

enum ClaimReason {
  missingItem('missing_item'),
  wrongItem('wrong_item'),
  productFailure('product_failure'),
  other('other');

  final String value;

  const ClaimReason(this.value);
}
