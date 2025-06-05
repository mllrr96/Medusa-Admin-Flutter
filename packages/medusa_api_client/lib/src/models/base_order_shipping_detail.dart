/// BaseOrderShippingDetail
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The ID of the new changes to the shipping method.",
///             "title": "id"
///         },
///         "shipping_method_id": {
///             "type": "string",
///             "description": "The ID of the shipping method.",
///             "title": "shipping_method_id"
///         },
///         "shipping_method": {
///             "type": "object"
///         },
///         "claim_id": {
///             "type": "string",
///             "description": "The ID of the associated claim.",
///             "title": "claim_id"
///         },
///         "exchange_id": {
///             "type": "string",
///             "description": "The ID of the associated exchange.",
///             "title": "exchange_id"
///         },
///         "return_id": {
///             "type": "string",
///             "description": "The ID of the associated return.",
///             "title": "return_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping method change was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping method change was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "shipping_method_id",
///         "shipping_method",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "Details of changes to a shipping method."
/// }
library;

import 'exports.dart';
part 'base_order_shipping_detail.freezed.dart';
part 'base_order_shipping_detail.g.dart'; // BaseOrderShippingDetail

@freezed
abstract class BaseOrderShippingDetail with _$BaseOrderShippingDetail {
  const BaseOrderShippingDetail._();

  @jsonSerializable
  const factory BaseOrderShippingDetail({
    /// id
    @JsonKey(name: BaseOrderShippingDetail.idKey) required String id,

    /// shippingMethodId
    @JsonKey(name: BaseOrderShippingDetail.shippingMethodIdKey)
    required String shippingMethodId,

    /// shippingMethod
    @JsonKey(name: BaseOrderShippingDetail.shippingMethodKey)
    required Map<String, dynamic> shippingMethod,

    /// claimId
    @JsonKey(name: BaseOrderShippingDetail.claimIdKey) required String claimId,

    /// exchangeId
    @JsonKey(name: BaseOrderShippingDetail.exchangeIdKey)
    required String exchangeId,

    /// returnId
    @JsonKey(name: BaseOrderShippingDetail.returnIdKey)
    required String returnId,

    /// createdAt
    @JsonKey(name: BaseOrderShippingDetail.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseOrderShippingDetail.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseOrderShippingDetail;

  factory BaseOrderShippingDetail.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderShippingDetailFromJson(json);

  static const String idKey = r'id';

  static const String shippingMethodIdKey = r'shipping_method_id';

  static const String shippingMethodKey = r'shipping_method';

  static const String claimIdKey = r'claim_id';

  static const String exchangeIdKey = r'exchange_id';

  static const String returnIdKey = r'return_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
