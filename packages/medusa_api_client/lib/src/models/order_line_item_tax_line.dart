/// OrderLineItemTaxLine
/// {
///     "properties": {
///         "item": {
///             "type": "object"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the line item that the tax line belongs to.",
///             "title": "item_id"
///         },
///         "total": {
///             "type": "number",
///             "description": "The item's total including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The item's total excluding taxes, including promotions.",
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
///             "description": "The ID of the tax provider used to calculate the tax lines.",
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
///     "description": "The line item tax line's details."
/// }
library;

import 'exports.dart';
part 'order_line_item_tax_line.freezed.dart';
part 'order_line_item_tax_line.g.dart'; // OrderLineItemTaxLine

@freezed
abstract class OrderLineItemTaxLine with _$OrderLineItemTaxLine {
  const OrderLineItemTaxLine._();

  @jsonSerializable
  const factory OrderLineItemTaxLine({
    /// item
    @JsonKey(name: OrderLineItemTaxLine.itemKey)
    required Map<String, dynamic> item,

    /// itemId
    @JsonKey(name: OrderLineItemTaxLine.itemIdKey) required String itemId,

    /// total
    @JsonKey(name: OrderLineItemTaxLine.totalKey) required double total,

    /// subtotal
    @JsonKey(name: OrderLineItemTaxLine.subtotalKey) required double subtotal,

    /// id
    @JsonKey(name: OrderLineItemTaxLine.idKey) required String id,

    /// description
    @JsonKey(name: OrderLineItemTaxLine.descriptionKey)
    required String description,

    /// taxRateId
    @JsonKey(name: OrderLineItemTaxLine.taxRateIdKey) required String taxRateId,

    /// code
    @JsonKey(name: OrderLineItemTaxLine.codeKey) required String code,

    /// rate
    @JsonKey(name: OrderLineItemTaxLine.rateKey) required double rate,

    /// providerId
    @JsonKey(name: OrderLineItemTaxLine.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: OrderLineItemTaxLine.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderLineItemTaxLine.updatedAtKey)
    required DateTime updatedAt,
  }) = _OrderLineItemTaxLine;

  factory OrderLineItemTaxLine.fromJson(Map<String, dynamic> json) =>
      _$OrderLineItemTaxLineFromJson(json);

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
