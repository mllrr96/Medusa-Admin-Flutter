/// AdminDeletePaymentCollectionResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The payment collection's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the object that was deleted.",
///             "default": "payment-collection",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the object was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The result of deleting the payment collection."
/// }
library;

import 'exports.dart';
part 'admin_delete_payment_collection_response.freezed.dart';
part 'admin_delete_payment_collection_response.g.dart'; // AdminDeletePaymentCollectionResponse

@freezed
abstract class AdminDeletePaymentCollectionResponse
    with _$AdminDeletePaymentCollectionResponse {
  const AdminDeletePaymentCollectionResponse._();

  @jsonSerializable
  const factory AdminDeletePaymentCollectionResponse({
    /// id
    @JsonKey(name: AdminDeletePaymentCollectionResponse.idKey)
    required String id,

    /// object
    @Default('payment-collection')
    @JsonKey(name: AdminDeletePaymentCollectionResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminDeletePaymentCollectionResponse.deletedKey)
    required bool deleted,
  }) = _AdminDeletePaymentCollectionResponse;

  factory AdminDeletePaymentCollectionResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminDeletePaymentCollectionResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
