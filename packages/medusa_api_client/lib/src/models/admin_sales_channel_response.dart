/// AdminSalesChannelResponse
/// {
///     "properties": {
///         "sales_channel": {
///             "$ref": "#/components/schemas/AdminSalesChannel"
///         }
///     },
///     "type": "object",
///     "required": [
///         "sales_channel"
///     ],
///     "description": "The sales channel's details."
/// }
library;

import 'exports.dart';
part 'admin_sales_channel_response.freezed.dart';
part 'admin_sales_channel_response.g.dart'; // AdminSalesChannelResponse

@freezed
abstract class AdminSalesChannelResponse with _$AdminSalesChannelResponse {
  const AdminSalesChannelResponse._();

  @jsonSerializable
  const factory AdminSalesChannelResponse({
    /// salesChannel
    @JsonKey(name: AdminSalesChannelResponse.salesChannelKey)
    required AdminSalesChannel salesChannel,
  }) = _AdminSalesChannelResponse;

  factory AdminSalesChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminSalesChannelResponseFromJson(json);

  static const String salesChannelKey = r'sales_channel';
}
