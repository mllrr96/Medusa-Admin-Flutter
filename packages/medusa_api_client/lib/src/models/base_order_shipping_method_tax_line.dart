/// BaseOrderShippingMethodTaxLine
/// {
///     "properties": {
///         "shipping_method": {
///             "type": "object"
///         },
///         "shipping_method_id": {
///             "type": "string",
///             "description": "The ID of the shipping method this tax line belongs to.",
///             "title": "shipping_method_id"
///         },
///         "total": {
///             "type": "number",
///             "description": "The shipping method's total including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The shipping method's total excluding taxes, including promotions.",
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
///             "description": "The ID of the tax provider handling the tax calculation.",
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
///         "shipping_method",
///         "shipping_method_id",
///         "total",
///         "subtotal",
///         "id",
///         "code",
///         "rate",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The tax line's details."
/// }
library;

import 'exports.dart';
part 'base_order_shipping_method_tax_line.freezed.dart';
part 'base_order_shipping_method_tax_line.g.dart'; // BaseOrderShippingMethodTaxLine

@freezed
abstract class BaseOrderShippingMethodTaxLine
    with _$BaseOrderShippingMethodTaxLine {
  const BaseOrderShippingMethodTaxLine._();

  @jsonSerializable
  const factory BaseOrderShippingMethodTaxLine({
    /// shippingMethod
    @JsonKey(name: BaseOrderShippingMethodTaxLine.shippingMethodKey)
    required Map<String, dynamic> shippingMethod,

    /// shippingMethodId
    @JsonKey(name: BaseOrderShippingMethodTaxLine.shippingMethodIdKey)
    required String shippingMethodId,

    /// total
    @JsonKey(name: BaseOrderShippingMethodTaxLine.totalKey)
    required double total,

    /// subtotal
    @JsonKey(name: BaseOrderShippingMethodTaxLine.subtotalKey)
    required double subtotal,

    /// id
    @JsonKey(name: BaseOrderShippingMethodTaxLine.idKey) required String id,

    /// description
    @JsonKey(name: BaseOrderShippingMethodTaxLine.descriptionKey)
    required String description,

    /// taxRateId
    @JsonKey(name: BaseOrderShippingMethodTaxLine.taxRateIdKey)
    required String taxRateId,

    /// code
    @JsonKey(name: BaseOrderShippingMethodTaxLine.codeKey) required String code,

    /// rate
    @JsonKey(name: BaseOrderShippingMethodTaxLine.rateKey) required double rate,

    /// providerId
    @JsonKey(name: BaseOrderShippingMethodTaxLine.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: BaseOrderShippingMethodTaxLine.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseOrderShippingMethodTaxLine.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseOrderShippingMethodTaxLine;

  factory BaseOrderShippingMethodTaxLine.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderShippingMethodTaxLineFromJson(json);

  static const String shippingMethodKey = r'shipping_method';

  static const String shippingMethodIdKey = r'shipping_method_id';

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
