
import 'claim_item.dart';

class ClaimImage {
  String? id;
  String? claimItemId;
  ClaimItem? claimItem;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  DateTime? metadata;

  ClaimImage({
    this.id,
    this.claimItemId,
    this.claimItem,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  ClaimImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    claimItemId = json['claim_item_id'];
    claimItem = json['claim_item'] != null
        ? ClaimItem.fromJson(json['claim_item'])
        : null;
    url = json['url'];
    createdAt = DateTime.tryParse(json['created_at'] ?? {});
    updatedAt = DateTime.tryParse(json['updated_at'] ?? {});
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? {});
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['claim_item_id'] = claimItemId;
    json['claim_item'] = claimItem?.toJson() ?? {};
    json['url'] = url;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['metadata'] = metadata;
    return json;
  }
}
