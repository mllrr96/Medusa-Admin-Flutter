/// AdminDraftOrderListResponse
/// {
///     "properties": {
///         "limit": {
///             "type": "number",
///             "description": "The maximum number of items retrieved.",
///             "title": "limit"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items skipped before retrieving the returned items.",
///             "title": "offset"
///         },
///         "count": {
///             "type": "number",
///             "description": "The total count of items available.",
///             "title": "count"
///         },
///         "draft_orders": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminDraftOrder"
///             },
///             "description": "The list of draft orders."
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
///         "draft_orders"
///     ],
///     "description": "The list of draft orders with pagination fields."
/// }
library;

import 'exports.dart';
part 'admin_draft_order_list_response.freezed.dart';
part 'admin_draft_order_list_response.g.dart'; // AdminDraftOrderListResponse

@freezed
abstract class AdminDraftOrderListResponse with _$AdminDraftOrderListResponse {
  const AdminDraftOrderListResponse._();

  @jsonSerializable
  const factory AdminDraftOrderListResponse({
    /// limit
    @JsonKey(name: AdminDraftOrderListResponse.limitKey) required int limit,

    /// offset
    @JsonKey(name: AdminDraftOrderListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: AdminDraftOrderListResponse.countKey) required int count,

    /// draftOrders
    @JsonKey(name: AdminDraftOrderListResponse.draftOrdersKey)
    required List<AdminDraftOrder> draftOrders,

    /// estimateCount
    @JsonKey(name: AdminDraftOrderListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminDraftOrderListResponse;

  factory AdminDraftOrderListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminDraftOrderListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String draftOrdersKey = r'draft_orders';

  static const String estimateCountKey = r'estimate_count';
}
