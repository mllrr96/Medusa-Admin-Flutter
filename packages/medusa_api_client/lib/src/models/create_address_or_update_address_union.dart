/// CreateAddressOrUpdateAddressUnion
/// {
///     "oneOf": [
///         {
///             "$ref": "#/components/schemas/CreateAddress"
///         },
///         {
///             "$ref": "#/components/schemas/UpdateAddress"
///         }
///     ],
///     "runtimeType": "oneOf"
/// }
library;

import 'exports.dart';
part 'create_address_or_update_address_union.freezed.dart';
part 'create_address_or_update_address_union.g.dart'; // CreateAddressOrUpdateAddressUnion

@freezed
sealed class CreateAddressOrUpdateAddressUnion
    with _$CreateAddressOrUpdateAddressUnion {
  const CreateAddressOrUpdateAddressUnion._();

  @jsonSerializable
  @FreezedUnionValue("CreateAddress")
  const factory CreateAddressOrUpdateAddressUnion.createAddress(
    CreateAddress value,
  ) = CreateAddressOrUpdateAddressUnionCreateAddress;

  @jsonSerializable
  @FreezedUnionValue("UpdateAddress")
  const factory CreateAddressOrUpdateAddressUnion.updateAddress(
    UpdateAddress value,
  ) = CreateAddressOrUpdateAddressUnionUpdateAddress;

  factory CreateAddressOrUpdateAddressUnion.fromJson(
    Map<String, dynamic> json,
  ) => _$CreateAddressOrUpdateAddressUnionFromJson(json);
}
