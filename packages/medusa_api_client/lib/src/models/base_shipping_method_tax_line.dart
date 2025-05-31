/// BaseShippingMethodTaxLine
/// {
///     "properties": {
///         "shipping_method": {
///             "type": "object"
///         },
///         "shipping_method_id": {
///             "type": "string",
///             "description": "The ID of this shipping method the tax line belongs to.",
///             "title": "shipping_method_id"
///         },
///         "total": {
///             "type": "number",
///             "description": "The method's total including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The method's total excluding taxes, including promotions.",
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
///             "description": "The code that the rate is identified by.",
///             "title": "code"
///         },
///         "rate": {
///             "type": "number",
///             "description": "The rate to charge.",
///             "title": "rate"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the tax provider that calculated the taxes.",
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
part 'base_shipping_method_tax_line.freezed.dart';
part 'base_shipping_method_tax_line.g.dart'; // BaseShippingMethodTaxLine

@freezed
abstract class BaseShippingMethodTaxLine with _$BaseShippingMethodTaxLine {
  const BaseShippingMethodTaxLine._();

  @jsonSerializable
  const factory BaseShippingMethodTaxLine({
    /// shippingMethod
    @JsonKey(name: BaseShippingMethodTaxLine.shippingMethodKey)
    required Map<String, dynamic> shippingMethod,

    /// shippingMethodId
    @JsonKey(name: BaseShippingMethodTaxLine.shippingMethodIdKey)
    required String shippingMethodId,

    /// total
    @JsonKey(name: BaseShippingMethodTaxLine.totalKey) required double total,

    /// subtotal
    @JsonKey(name: BaseShippingMethodTaxLine.subtotalKey)
    required double subtotal,

    /// id
    @JsonKey(name: BaseShippingMethodTaxLine.idKey) required String id,

    /// description
    @JsonKey(name: BaseShippingMethodTaxLine.descriptionKey)
    required String description,

    /// taxRateId
    @JsonKey(name: BaseShippingMethodTaxLine.taxRateIdKey)
    required String taxRateId,

    /// code
    @JsonKey(name: BaseShippingMethodTaxLine.codeKey) required String code,

    /// rate
    @JsonKey(name: BaseShippingMethodTaxLine.rateKey) required double rate,

    /// providerId
    @JsonKey(name: BaseShippingMethodTaxLine.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: BaseShippingMethodTaxLine.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseShippingMethodTaxLine.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseShippingMethodTaxLine;

  factory BaseShippingMethodTaxLine.fromJson(Map<String, dynamic> json) =>
      _$BaseShippingMethodTaxLineFromJson(json);

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
