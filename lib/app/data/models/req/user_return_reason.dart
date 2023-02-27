class UserCreateReturnReasonReq {
  UserCreateReturnReasonReq({
    required this.label,
    required this.value,
     this.parentReturnReasonId,
    required this.description,
    this.metadata,
  });
  final String label;
  final String value;
  final String? parentReturnReasonId;
  final String? description;
  final Map<String, dynamic>? metadata;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    data['parent_return_reason_id'] = parentReturnReasonId;
    data['description'] = description;
    data['metadata'] = metadata;
    return data;
  }
}

class UserUpdateReturnReasonReq {
  UserUpdateReturnReasonReq({
    required this.label,
    required this.value,
    required this.description,
    this.metadata,
  });
  final String label;
  final String value;
  final String? description;
  final Map<String, dynamic>? metadata;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    data['description'] = description;
    data['metadata'] = metadata;
    return data;
  }
}
