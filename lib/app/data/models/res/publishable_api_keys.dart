import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/publishable_api_key.dart';

class UserRetrievePublishableApiKeysRes extends PaginatedResponse {
  List<PublishableApiKey>? keys;

  UserRetrievePublishableApiKeysRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['publishable_api_keys'] == null) return;
    keys = <PublishableApiKey>[];
    json['publishable_api_keys'].forEach((v) => keys!.add(PublishableApiKey.fromJson(v)));
  }
}

class UserPublishableApiKeyRes {
  final PublishableApiKey? key;
  UserPublishableApiKeyRes(this.key);
  factory UserPublishableApiKeyRes.fromJson(Map<String, dynamic> json) {
    return UserPublishableApiKeyRes(
        json['publishable_api_key'] == null ? null : PublishableApiKey.fromJson(json['publishable_api_key']));
  }
}

class UserDeletePublishableApiKeyRes {
  /// The ID of the deleted PublishableApiKey.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "publishable_api_key"
  final String? object;

  /// Whether the PublishableApiKeys was deleted successfully or not.
  final bool deleted;

  UserDeletePublishableApiKeyRes({
    required this.deleted,
    this.id,
    this.object,
  });

  factory UserDeletePublishableApiKeyRes.fromJson(json) {
    return UserDeletePublishableApiKeyRes(
      deleted: json['deleted'] ?? false,
      id: json['id'],
      object: json['object'],
    );
  }
}
