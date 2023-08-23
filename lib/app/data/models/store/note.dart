import 'index.dart';


class Note {
  String? id;
  String? resourceType;
  String? resourceId;
  String? value;
  String? authorId;
  User? author;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  Note({
    this.id,
    required this.resourceType,
    required this.resourceId,
    required this.value,
    this.authorId,
    this.author,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const <String, dynamic>{},
  });

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resourceType = json['resource_type'];
    resourceId = json['resource_id'];
    value = json['value'];
    authorId = json['author_id'];
    author = json['author'] != null ? User.fromJson(json['author']) : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['resource_type'] = resourceType;
    json['resource_id'] = resourceId;
    json['value'] = value;
    json['author_id'] = authorId;
    json['author'] = author?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
