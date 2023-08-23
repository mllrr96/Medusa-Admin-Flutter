class ImageData {
  String? id;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  ImageData({
    this.id,
    required this.url,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const {},
  });

  ImageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['url'] = url;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
