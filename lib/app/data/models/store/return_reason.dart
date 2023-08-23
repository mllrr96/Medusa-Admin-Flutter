class ReturnReason {
  /// The return reason's ID
  ///
  /// Example: "rr_01G8X82GCCV2KSQHDBHSSAH5TQ"
  String? id;

  /// A description of the Reason.
  ///
  /// Example: "Items that are damaged"
  String? description;

  /// A text that can be displayed to the Customer as a reason.
  ///
  /// Example: "Damaged goods"
  String? label;

  /// The value to identify the reason by.
  ///
  /// Example: "damaged"
  String? value;

  /// The date with timezone at which the resource was created.
  DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  DateTime? deletedAt;

  /// An optional key-value map with additional details
  ///
  /// Example: {"car":"white"}
  Map<String, dynamic>? metadata;

  /// The ID of the parent reason.
  String? parentReturnReasonId;
  ReturnReason? parentReturnReason;
  List<ReturnReason>? returnReasonChildren;

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
    // parentReturnReason =
    //     json['parent_return_reason'] != null ? ReturnReason.fromJson(json['parent_return_reason']) : null;
    //
    if (json['return_reason_children'] != null) {
      returnReasonChildren = [];
      for (var element in (json['return_reason_children'] as List)) {
        returnReasonChildren?.add(ReturnReason.fromJson(element));
      }
    }

    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['description'] = description;
    json['label'] = label;
    json['value'] = value;
    json['parent_return_reason_id'] = parentReturnReasonId;
    json['parent_return_reason'] = parentReturnReason?.toJson();
    // TODO: fix this
    // json['return_reason_children'] = returnReasonChildren?;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
