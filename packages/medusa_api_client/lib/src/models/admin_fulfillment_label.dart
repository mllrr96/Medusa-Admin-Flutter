/// AdminFulfillmentLabel
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The label's ID.",
///             "title": "id"
///         },
///         "tracking_number": {
///             "type": "string",
///             "description": "The label's tracking number.",
///             "title": "tracking_number"
///         },
///         "tracking_url": {
///             "type": "string",
///             "description": "The label's tracking URL.",
///             "title": "tracking_url"
///         },
///         "label_url": {
///             "type": "string",
///             "description": "The label's URL.",
///             "title": "label_url"
///         },
///         "fulfillment_id": {
///             "type": "string",
///             "description": "The ID of the fulfillment the label is associated with.",
///             "title": "fulfillment_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the label was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the label was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the label was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "tracking_number",
///         "tracking_url",
///         "label_url",
///         "fulfillment_id",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The details of a fulfillmet's shipment label."
/// }
library;

import 'exports.dart';
part 'admin_fulfillment_label.freezed.dart';
part 'admin_fulfillment_label.g.dart'; // AdminFulfillmentLabel

@freezed
abstract class AdminFulfillmentLabel with _$AdminFulfillmentLabel {
  const AdminFulfillmentLabel._();

  @jsonSerializable
  const factory AdminFulfillmentLabel({
    /// id
    @JsonKey(name: AdminFulfillmentLabel.idKey) required String id,

    /// trackingNumber
    @JsonKey(name: AdminFulfillmentLabel.trackingNumberKey)
    required String trackingNumber,

    /// trackingUrl
    @JsonKey(name: AdminFulfillmentLabel.trackingUrlKey)
    required String trackingUrl,

    /// labelUrl
    @JsonKey(name: AdminFulfillmentLabel.labelUrlKey) required String labelUrl,

    /// fulfillmentId
    @JsonKey(name: AdminFulfillmentLabel.fulfillmentIdKey)
    required String fulfillmentId,

    /// createdAt
    @JsonKey(name: AdminFulfillmentLabel.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminFulfillmentLabel.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminFulfillmentLabel.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminFulfillmentLabel;

  factory AdminFulfillmentLabel.fromJson(Map<String, dynamic> json) =>
      _$AdminFulfillmentLabelFromJson(json);

  static const String idKey = r'id';

  static const String trackingNumberKey = r'tracking_number';

  static const String trackingUrlKey = r'tracking_url';

  static const String labelUrlKey = r'label_url';

  static const String fulfillmentIdKey = r'fulfillment_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
