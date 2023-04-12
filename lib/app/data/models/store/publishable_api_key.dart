class PublishableApiKey {
  const PublishableApiKey({
    this.id,
    this.title,
    this.createdAt,
    this.revokedAt,
    this.revokedBy,
    this.updatedAt,
    this.createdBy,
  });

  final String? id;
  final String? title;
  final String? revokedBy;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? revokedAt;

  factory PublishableApiKey.fromJson(Map<String, dynamic> json) {
    return PublishableApiKey(
      id: json['id'],
      title: json['title'],
      revokedBy: json['revoked_by'],
      createdBy: json['created_by'],
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      revokedAt: DateTime.tryParse(json['revoked_at'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['revoked_by'] = revokedBy;
    json['created_by'] = createdBy;
    json['updated_at'] = updatedAt.toString();
    json['revoked_at'] = revokedAt.toString();
    json['created_at'] = createdAt.toString();

    return json;
  }
}
