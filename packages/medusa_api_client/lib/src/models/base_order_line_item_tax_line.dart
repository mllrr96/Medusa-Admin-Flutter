/// BaseOrderLineItemTaxLine
/// {
///     "properties": {
///         "item": {
///             "type": "object"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the associated line item.",
///             "title": "item_id"
///         },
///         "total": {
///             "type": "number",
///             "description": "The tax line's total including promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The tax line's subtotal excluding promotions.",
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
///             "description": "The ID of the applied tax rate.",
///             "title": "tax_rate_id"
///         },
///         "code": {
///             "type": "string",
///             "description": "The code that the tax rate is identified by.",
///             "title": "code"
///         },
///         "rate": {
///             "type": "number",
///             "description": "The rate to charge.",
///             "title": "rate"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the tax provider used to calculate the tax line.",
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
///     "description": "The tax line's tax lines."
/// }
library;

import 'exports.dart';
part 'base_order_line_item_tax_line.freezed.dart';
part 'base_order_line_item_tax_line.g.dart'; // BaseOrderLineItemTaxLine

@freezed
abstract class BaseOrderLineItemTaxLine with _$BaseOrderLineItemTaxLine {
  const BaseOrderLineItemTaxLine._();

  @jsonSerializable
  const factory BaseOrderLineItemTaxLine({
    /// item
    @JsonKey(name: BaseOrderLineItemTaxLine.itemKey)
    required Map<String, dynamic> item,

    /// itemId
    @JsonKey(name: BaseOrderLineItemTaxLine.itemIdKey) required String itemId,

    /// total
    @JsonKey(name: BaseOrderLineItemTaxLine.totalKey) required double total,

    /// subtotal
    @JsonKey(name: BaseOrderLineItemTaxLine.subtotalKey)
    required double subtotal,

    /// id
    @JsonKey(name: BaseOrderLineItemTaxLine.idKey) required String id,

    /// description
    @JsonKey(name: BaseOrderLineItemTaxLine.descriptionKey)
    required String description,

    /// taxRateId
    @JsonKey(name: BaseOrderLineItemTaxLine.taxRateIdKey)
    required String taxRateId,

    /// code
    @JsonKey(name: BaseOrderLineItemTaxLine.codeKey) required String code,

    /// rate
    @JsonKey(name: BaseOrderLineItemTaxLine.rateKey) required double rate,

    /// providerId
    @JsonKey(name: BaseOrderLineItemTaxLine.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: BaseOrderLineItemTaxLine.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseOrderLineItemTaxLine.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseOrderLineItemTaxLine;

  factory BaseOrderLineItemTaxLine.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderLineItemTaxLineFromJson(json);

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
