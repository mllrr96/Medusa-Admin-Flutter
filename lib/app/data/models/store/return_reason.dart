import 'index.dart';

class ReturnReason {
  String? id;
  String? description;
  String? label;
  String? value;
  String? parentReturnReasonId;
  ReturnReason? parentReturnReason;
  ReturnReason? returnReasonChildren;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  ReturnReason({
    this.id,
    this.description,
    required this.label,
    required this.value,
    this.parentReturnReasonId,
    this.parentReturnReason,
    this.returnReasonChildren,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const <String, dynamic>{},
  });

  ReturnReason.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    label = json['label'];
    value = json['value'];
    parentReturnReasonId = json['parent_return_reason_id'];
    parentReturnReason = json['parent_return_reason'] != null
        ? ReturnReason.fromJson(json['parent_return_reason'])
        : null;
    returnReasonChildren = json['return_reason_children'] != null
        ? ReturnReason.fromJson(json['return_reason_children'])
        : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? {});
    updatedAt = DateTime.tryParse(json['updated_at'] ?? {});
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? {});
    metadata = json['metadata'] ?? <String, dynamic>{};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['description'] = description;
    json['label'] = label;
    json['value'] = value;
    json['parent_return_reason_id'] = parentReturnReasonId;
    json['parent_return_reason'] = parentReturnReason?.toJson();
    json['return_reason_children'] = returnReasonChildren?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
