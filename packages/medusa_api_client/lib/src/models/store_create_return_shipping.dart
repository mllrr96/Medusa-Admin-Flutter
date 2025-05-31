/// StoreCreateReturnShipping
/// {
///     "properties": {
///         "option_id": {
///             "type": "string",
///             "description": "The ID of the shipping option to use.",
///             "title": "option_id"
///         },
///         "price": {
///             "type": "number",
///             "description": "The shipping's price.",
///             "title": "price"
///         }
///     },
///     "type": "object",
///     "required": [
///         "option_id"
///     ],
///     "description": "The return's shipping details."
/// }
library;

import 'exports.dart';
part 'store_create_return_shipping.freezed.dart';
part 'store_create_return_shipping.g.dart'; // StoreCreateReturnShipping

@freezed
abstract class StoreCreateReturnShipping with _$StoreCreateReturnShipping {
  const StoreCreateReturnShipping._();

  @jsonSerializable
  const factory StoreCreateReturnShipping({
    /// optionId
    @JsonKey(name: StoreCreateReturnShipping.optionIdKey)
    required String optionId,

    /// price
    @JsonKey(name: StoreCreateReturnShipping.priceKey) required double price,
  }) = _StoreCreateReturnShipping;

  factory StoreCreateReturnShipping.fromJson(Map<String, dynamic> json) =>
      _$StoreCreateReturnShippingFromJson(json);

  static const String optionIdKey = r'option_id';

  static const String priceKey = r'price';
}
