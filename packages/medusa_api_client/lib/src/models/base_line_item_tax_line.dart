/// BaseLineItemTaxLine
/// {
///     "properties": {
///         "item": {
///             "$ref": "#/components/schemas/BaseCartLineItem"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the item the tax line applies on.",
///             "title": "item_id"
///         },
///         "total": {
///             "type": "number",
///             "description": "The item's total, including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The item's subtotal excluding taxes, including promotions.",
///             "title": "subtotal"
///         },
///         "id": {
///             "type": "string",
///             "description": "The tax line's ID.",
///             "title": "id"
///         },
///         "description": {
///             "type": "string",
///             "description": "The tax line's description.",
///             "title": "description"
///         },
///         "tax_rate_id": {
///             "type": "string",
///             "description": "The ID of the associated tax rate.",
///             "title": "tax_rate_id"
///         },
///         "code": {
///             "type": "string",
///             "description": "The code the tax rate is identified by.",
///             "title": "code"
///         },
///         "rate": {
///             "type": "number",
///             "description": "The rate to charge.",
///             "title": "rate"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the tax provider.",
///             "title": "provider_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tax line was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tax line was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "item",
///         "item_id",
///         "total",
///         "subtotal",
///         "id",
///         "code",
///         "rate",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The tax line's details"
/// }
library base_line_item_tax_line;

import 'exports.dart';
part 'base_line_item_tax_line.freezed.dart';
part 'base_line_item_tax_line.g.dart'; // BaseLineItemTaxLine

@freezed
abstract class BaseLineItemTaxLine with _$BaseLineItemTaxLine {
  const BaseLineItemTaxLine._();

  @jsonSerializable
  const factory BaseLineItemTaxLine({
    /// item
    @JsonKey(name: BaseLineItemTaxLine.itemKey) required BaseCartLineItem item,

    /// itemId
    @JsonKey(name: BaseLineItemTaxLine.itemIdKey) required String itemId,

    /// total
    @JsonKey(name: BaseLineItemTaxLine.totalKey) required double total,

    /// subtotal
    @JsonKey(name: BaseLineItemTaxLine.subtotalKey) required double subtotal,

    /// id
    @JsonKey(name: BaseLineItemTaxLine.idKey) required String id,

    /// description
    @JsonKey(name: BaseLineItemTaxLine.descriptionKey)
    required String description,

    /// taxRateId
    @JsonKey(name: BaseLineItemTaxLine.taxRateIdKey) required String taxRateId,

    /// code
    @JsonKey(name: BaseLineItemTaxLine.codeKey) required String code,

    /// rate
    @JsonKey(name: BaseLineItemTaxLine.rateKey) required double rate,

    /// providerId
    @JsonKey(name: BaseLineItemTaxLine.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: BaseLineItemTaxLine.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseLineItemTaxLine.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseLineItemTaxLine;

  factory BaseLineItemTaxLine.fromJson(Map<String, dynamic> json) =>
      _$BaseLineItemTaxLineFromJson(json);

  static const String itemKey = r'item';

  static const String itemIdKey = r'item_id';

  static const String totalKey = r'total';

  static const String subtotalKey = r'subtotal';

  static const String idKey = r'id';

  static const String descriptionKey = r'description';

  static const String taxRateIdKey = r'tax_rate_id';

  static const String codeKey = r'code';

  static const String rateKey = r'rate';

  static const String providerIdKey = r'provider_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
