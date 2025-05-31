/// DeleteCustomersIdAddressesAddressIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields. This API route restricts the fields that can be selected. Learn how to override the retrievable fields in the [Retrieve Custom Links](https://docs.medusajs.com/learn/fundamentals/api-routes/retrieve-custom-links) documentation.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'delete_customers_id_addresses_address_id_query_parameters.freezed.dart';
part 'delete_customers_id_addresses_address_id_query_parameters.g.dart'; // DeleteCustomersIdAddressesAddressIdQueryParameters

@freezed
abstract class DeleteCustomersIdAddressesAddressIdQueryParameters
    with _$DeleteCustomersIdAddressesAddressIdQueryParameters {
  const DeleteCustomersIdAddressesAddressIdQueryParameters._();

  @jsonSerializable
  const factory DeleteCustomersIdAddressesAddressIdQueryParameters({
    /// fields
    @JsonKey(name: DeleteCustomersIdAddressesAddressIdQueryParameters.fieldsKey)
    required String fields,
  }) = _DeleteCustomersIdAddressesAddressIdQueryParameters;

  factory DeleteCustomersIdAddressesAddressIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteCustomersIdAddressesAddressIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
