/// StoreCustomerAddressListResponse
/// {
///     "properties": {
///         "limit": {
///             "type": "number",
///             "description": "The maximum number of items returned.",
///             "title": "limit"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items skipped before retrieving the returned items.",
///             "title": "offset"
///         },
///         "count": {
///             "type": "number",
///             "description": "The total number of items.",
///             "title": "count"
///         },
///         "addresses": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreCustomerAddress"
///             },
///             "description": "The list of addresses."
///         },
///         "estimate_count": {
///             "type": "number",
///             "description": "The estimated count retrieved from the PostgreSQL query planner, which may be inaccurate.",
///             "title": "estimate_count"
///         }
///     },
///     "type": "object",
///     "required": [
///         "limit",
///         "offset",
///         "count",
///         "addresses"
///     ],
///     "description": "The paginated list of customer addresses."
/// }
library;

import 'exports.dart';
part 'store_customer_address_list_response.freezed.dart';
part 'store_customer_address_list_response.g.dart'; // StoreCustomerAddressListResponse

@freezed
abstract class StoreCustomerAddressListResponse
    with _$StoreCustomerAddressListResponse {
  const StoreCustomerAddressListResponse._();

  @jsonSerializable
  const factory StoreCustomerAddressListResponse({
    /// limit
    @JsonKey(name: StoreCustomerAddressListResponse.limitKey)
    required int limit,

    /// offset
    @JsonKey(name: StoreCustomerAddressListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: StoreCustomerAddressListResponse.countKey)
    required int count,

    /// addresses
    @JsonKey(name: StoreCustomerAddressListResponse.addressesKey)
    required List<StoreCustomerAddress> addresses,

    /// estimateCount
    @JsonKey(name: StoreCustomerAddressListResponse.estimateCountKey)
    required double estimateCount,
  }) = _StoreCustomerAddressListResponse;

  factory StoreCustomerAddressListResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$StoreCustomerAddressListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String addressesKey = r'addresses';

  static const String estimateCountKey = r'estimate_count';
}
