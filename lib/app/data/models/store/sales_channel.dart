class SalesChannel {
  String? id;
  String? name;
  String? description;
  bool? isDisabled;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  SalesChannel({
    this.id,
    required this.name,
    this.description,
    this.isDisabled,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  SalesChannel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isDisabled = json['is_disabled'];
    // createdAt = DateTime.tryParse(json['created_at'] ?? {});
    // updatedAt = DateTime.tryParse(json['updated_at'] ?? {});
    // deletedAt = DateTime.tryParse(json['deleted_at'] ?? {});
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['description'] = description;
    json['is_disabled'] = isDisabled;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    return json;
  }
}
