class User {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? apiToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  User({
    this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.apiToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const <String, dynamic>{},
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    apiToken = json['api_token'];
    // createdAt = DateTime.tryParse(json['created_at'] ?? {});
    // updatedAt = DateTime.tryParse(json['updated_at'] ?? {});
    // deletedAt = DateTime.tryParse(json['deleted_at'] ?? {});
    print(json['metadata']);
    // metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['email'] = email;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['api_token'] = apiToken;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

enum UserRoles {
  admin('admin'),
  member('member'),
  developer('developer');

  final String value;

  const UserRoles(this.value);
}
