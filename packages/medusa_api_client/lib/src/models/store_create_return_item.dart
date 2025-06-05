/// StoreCreateReturnItem
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The item's ID.",
///             "title": "id"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "reason_id": {
///             "type": "string",
///             "description": "The ID of the associated return reason.",
///             "title": "reason_id"
///         },
///         "note": {
///             "type": "string",
///             "description": "A note with more details about the returned item.",
///             "title": "note"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "quantity"
///     ],
///     "description": "The details of the line item to create."
/// }
library;

import 'exports.dart';
part 'store_create_return_item.freezed.dart';
part 'store_create_return_item.g.dart'; // StoreCreateReturnItem

@freezed
abstract class StoreCreateReturnItem with _$StoreCreateReturnItem {
  const StoreCreateReturnItem._();

  @jsonSerializable
  const factory StoreCreateReturnItem({
    /// id
    @JsonKey(name: StoreCreateReturnItem.idKey) required String id,

    /// quantity
    @JsonKey(name: StoreCreateReturnItem.quantityKey) required double quantity,

    /// reasonId
    @JsonKey(name: StoreCreateReturnItem.reasonIdKey) required String reasonId,

    /// note
    @JsonKey(name: StoreCreateReturnItem.noteKey) required String note,
  }) = _StoreCreateReturnItem;

  factory StoreCreateReturnItem.fromJson(Map<String, dynamic> json) =>
      _$StoreCreateReturnItemFromJson(json);

  static const String idKey = r'id';

  static const String quantityKey = r'quantity';

  static const String reasonIdKey = r'reason_id';

  static const String noteKey = r'note';
}
