/// GetPaymentsPaymentProvidersQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items to skip when retrieving a list.",
///             "title": "offset"
///         },
///         "limit": {
///             "type": "number",
///             "description": "Limit the number of items returned in the list.",
///             "title": "limit"
///         },
///         "order": {
///             "type": "string",
///             "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`.",
///             "title": "order"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a payment provider's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A payment provider ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by payment provider IDs."
///                 }
///             ]
///         },
///         "is_enabled": {
///             "type": "boolean",
///             "description": "Filter by whether the payment provider is enabled.",
///             "title": "is_enabled"
///         },
///         "$and": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "Join query parameters with an AND condition. Each object's content is the same type as the expected query parameters.",
///             "title": "$and"
///         },
///         "$or": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "Join query parameters with an OR condition. Each object's content is the same type as the expected query parameters.",
///             "title": "$or"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_payments_payment_providers_query_parameters.freezed.dart';
part 'get_payments_payment_providers_query_parameters.g.dart'; // GetPaymentsPaymentProvidersQueryParameters

@freezed
abstract class GetPaymentsPaymentProvidersQueryParameters
    with _$GetPaymentsPaymentProvidersQueryParameters {
  const GetPaymentsPaymentProvidersQueryParameters._();

  @jsonSerializable
  const factory GetPaymentsPaymentProvidersQueryParameters({
    /// fields
    @JsonKey(name: GetPaymentsPaymentProvidersQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetPaymentsPaymentProvidersQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetPaymentsPaymentProvidersQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetPaymentsPaymentProvidersQueryParameters.orderKey)
    required String order,

    /// id
    @JsonKey(name: GetPaymentsPaymentProvidersQueryParameters.idKey)
    required dynamic id,

    /// isEnabled
    @JsonKey(name: GetPaymentsPaymentProvidersQueryParameters.isEnabledKey)
    required bool isEnabled,

    /// and
    @JsonKey(name: GetPaymentsPaymentProvidersQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetPaymentsPaymentProvidersQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetPaymentsPaymentProvidersQueryParameters;

  factory GetPaymentsPaymentProvidersQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetPaymentsPaymentProvidersQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String idKey = r'id';

  static const String isEnabledKey = r'is_enabled';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
