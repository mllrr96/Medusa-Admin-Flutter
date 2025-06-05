/// AdminPromotion
/// {
///     "properties": {
///         "application_method": {
///             "$ref": "#/components/schemas/AdminApplicationMethod"
///         },
///         "rules": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPromotionRule"
///             },
///             "description": "The promotion's rules."
///         },
///         "id": {
///             "type": "string",
///             "description": "The promotion's ID.",
///             "title": "id"
///         },
///         "code": {
///             "type": "string",
///             "description": "The promotion's code.",
///             "title": "code"
///         },
///         "type": {
///             "enum": [
///                 "standard",
///                 "buyget"
///             ],
///             "type": "string",
///             "description": "The promotion's type."
///         },
///         "is_automatic": {
///             "type": "boolean",
///             "description": "Whether the promotion is applied on a cart automatically if it matches the promotion's rules.",
///             "title": "is_automatic"
///         },
///         "campaign_id": {
///             "type": "string",
///             "description": "The ID of the campaign this promotion belongs to.",
///             "title": "campaign_id"
///         },
///         "campaign": {
///             "$ref": "#/components/schemas/AdminCampaign"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the promotion was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the promotion was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the promotion was deleted.",
///             "title": "deleted_at"
///         },
///         "status": {
///             "enum": [
///                 "draft",
///                 "active",
///                 "inactive"
///             ],
///             "type": "string",
///             "description": "The promotion's status."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The promotion's details."
/// }
library;

import 'exports.dart';
part 'admin_promotion.freezed.dart';
part 'admin_promotion.g.dart'; // AdminPromotion

@freezed
abstract class AdminPromotion with _$AdminPromotion {
  const AdminPromotion._();

  @jsonSerializable
  const factory AdminPromotion({
    /// applicationMethod
    @JsonKey(name: AdminPromotion.applicationMethodKey)
    required AdminApplicationMethod applicationMethod,

    /// rules
    @JsonKey(name: AdminPromotion.rulesKey)
    required List<AdminPromotionRule> rules,

    /// id
    @JsonKey(name: AdminPromotion.idKey) required String id,

    /// code
    @JsonKey(name: AdminPromotion.codeKey) required String code,

    /// type
    @JsonKey(name: AdminPromotion.typeKey) required NullEnum type,

    /// isAutomatic
    @JsonKey(name: AdminPromotion.isAutomaticKey) required bool isAutomatic,

    /// campaignId
    @JsonKey(name: AdminPromotion.campaignIdKey) required String campaignId,

    /// campaign
    @JsonKey(name: AdminPromotion.campaignKey) required AdminCampaign campaign,

    /// createdAt
    @JsonKey(name: AdminPromotion.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminPromotion.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminPromotion.deletedAtKey) required DateTime deletedAt,

    /// status
    @JsonKey(name: AdminPromotion.statusKey) required NullEnum status,
  }) = _AdminPromotion;

  factory AdminPromotion.fromJson(Map<String, dynamic> json) =>
      _$AdminPromotionFromJson(json);

  static const String applicationMethodKey = r'application_method';

  static const String rulesKey = r'rules';

  static const String idKey = r'id';

  static const String codeKey = r'code';

  static const String typeKey = r'type';

  static const String isAutomaticKey = r'is_automatic';

  static const String campaignIdKey = r'campaign_id';

  static const String campaignKey = r'campaign';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String statusKey = r'status';
}
