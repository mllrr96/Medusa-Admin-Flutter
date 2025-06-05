/// BaseCartAddress
/// {
///     "type": "object",
///     "description": "The cart's shipping address."
/// }
library;

import 'exports.dart';
part 'base_cart_address.freezed.dart';
part 'base_cart_address.g.dart'; // BaseCartAddress

@freezed
abstract class BaseCartAddress with _$BaseCartAddress {
  const BaseCartAddress._();

  @jsonSerializable
  const factory BaseCartAddress() = _BaseCartAddress;

  factory BaseCartAddress.fromJson(Map<String, dynamic> json) =>
      _$BaseCartAddressFromJson(json);
}
