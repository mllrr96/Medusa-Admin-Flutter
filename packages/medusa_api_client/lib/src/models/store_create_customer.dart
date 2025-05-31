/// StoreCreateCustomer
/// {
///     "properties": {
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The customer's email.",
///             "title": "email"
///         },
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
///     "required": [
///         "email"
///     ],
///     "description": "The details of the customer to create."
/// }
library store_create_customer;

import 'exports.dart';
part 'store_create_customer.freezed.dart';
part 'store_create_customer.g.dart'; // StoreCreateCustomer

@freezed
abstract class StoreCreateCustomer with _$StoreCreateCustomer {
  const StoreCreateCustomer._();

  @jsonSerializable
  const factory StoreCreateCustomer({
    /// email
    @JsonKey(name: StoreCreateCustomer.emailKey) required String email,

    /// companyName
    @JsonKey(name: StoreCreateCustomer.companyNameKey)
    required String companyName,

    /// firstName
    @JsonKey(name: StoreCreateCustomer.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: StoreCreateCustomer.lastNameKey) required String lastName,

    /// phone
    @JsonKey(name: StoreCreateCustomer.phoneKey) required String phone,

    /// metadata
    @JsonKey(name: StoreCreateCustomer.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _StoreCreateCustomer;

  factory StoreCreateCustomer.fromJson(Map<String, dynamic> json) =>
      _$StoreCreateCustomerFromJson(json);

  static const String emailKey = r'email';

  static const String companyNameKey = r'company_name';

  static const String firstNameKey = r'first_name';

  static const String lastNameKey = r'last_name';

  static const String phoneKey = r'phone';

  static const String metadataKey = r'metadata';
}
