class ClaimTag {
  String? id;
  String? value;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic>? metadata ;

  ClaimTag({
    this.id,
    required this.value,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  ClaimTag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['value'] = value;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
