/// AdminCampaign
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The campaign's ID.",
///             "title": "id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The campaign's name.",
///             "title": "name"
///         },
///         "description": {
///             "type": "string",
///             "description": "The campaign's description.",
///             "title": "description"
///         },
///         "currency": {
///             "type": "string",
///             "description": "The campaign's currency.",
///             "title": "currency"
///         },
///         "campaign_identifier": {
///             "type": "string",
///             "description": "The campaign's identifier.",
///             "title": "campaign_identifier"
///         },
///         "starts_at": {
///             "type": "string",
///             "description": "The date and time that the campaign starts.",
///             "title": "starts_at"
///         },
///         "ends_at": {
///             "type": "string",
///             "description": "The date and time that the campaign ends.",
///             "title": "ends_at"
///         },
///         "budget": {
///             "type": "object",
///             "description": "The campaign's budget."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the campaign was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the campaign was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the campaign was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "description",
///         "currency",
///         "campaign_identifier",
///         "starts_at",
///         "ends_at",
///         "budget",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The campaign's details."
/// }
library;

import 'exports.dart';
part 'admin_campaign.freezed.dart';
part 'admin_campaign.g.dart'; // AdminCampaign

@freezed
abstract class AdminCampaign with _$AdminCampaign {
  const AdminCampaign._();

  @jsonSerializable
  const factory AdminCampaign({
    /// id
    @JsonKey(name: AdminCampaign.idKey) required String id,

    /// name
    @JsonKey(name: AdminCampaign.nameKey) required String name,

    /// description
    @JsonKey(name: AdminCampaign.descriptionKey) required String description,

    /// currency
    @JsonKey(name: AdminCampaign.currencyKey) required String currency,

    /// campaignIdentifier
    @JsonKey(name: AdminCampaign.campaignIdentifierKey)
    required String campaignIdentifier,

    /// startsAt
    @JsonKey(name: AdminCampaign.startsAtKey) required String startsAt,

    /// endsAt
    @JsonKey(name: AdminCampaign.endsAtKey) required String endsAt,

    /// budget
    @JsonKey(name: AdminCampaign.budgetKey)
    required Map<String, dynamic> budget,

    /// createdAt
    @JsonKey(name: AdminCampaign.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminCampaign.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminCampaign.deletedAtKey) required DateTime deletedAt,
  }) = _AdminCampaign;

  factory AdminCampaign.fromJson(Map<String, dynamic> json) =>
      _$AdminCampaignFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String descriptionKey = r'description';

  static const String currencyKey = r'currency';

  static const String campaignIdentifierKey = r'campaign_identifier';

  static const String startsAtKey = r'starts_at';

  static const String endsAtKey = r'ends_at';

  static const String budgetKey = r'budget';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
