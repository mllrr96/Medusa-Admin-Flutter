/// StoreUpdateCustomer
/// {
///     "properties": {
///         "company_name": {
///             "type": "string",
///             "description": "The customer's company name.",
///             "title": "company_name"
///         },
///         "first_name": {
///             "type": "string",
///             "description": "The customer's first name.",
///             "title": "first_name"
///         },
///         "last_name": {
///             "type": "string",
///             "description": "The customer's last name.",
///             "title": "last_name"
///         },
///         "phone": {
///             "type": "string",
///             "description": "The customer's phone.",
///             "title": "phone"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The customer's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The details to update in the customer."
/// }
library;

import 'exports.dart';
part 'store_update_customer.freezed.dart';
part 'store_update_customer.g.dart'; // StoreUpdateCustomer

@freezed
abstract class StoreUpdateCustomer with _$StoreUpdateCustomer {
  const StoreUpdateCustomer._();

  @jsonSerializable
  const factory StoreUpdateCustomer({
    /// companyName
    @JsonKey(name: StoreUpdateCustomer.companyNameKey)
    required String companyName,

    /// firstName
    @JsonKey(name: StoreUpdateCustomer.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: StoreUpdateCustomer.lastNameKey) required String lastName,

    /// phone
    @JsonKey(name: StoreUpdateCustomer.phoneKey) required String phone,

    /// metadata
    @JsonKey(name: StoreUpdateCustomer.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _StoreUpdateCustomer;

  factory StoreUpdateCustomer.fromJson(Map<String, dynamic> json) =>
      _$StoreUpdateCustomerFromJson(json);

  static const String companyNameKey = r'company_name';

  static const String firstNameKey = r'first_name';

  static const String lastNameKey = r'last_name';

  static const String phoneKey = r'phone';

  static const String metadataKey = r'metadata';
}
