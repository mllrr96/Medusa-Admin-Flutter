/// GetProductsQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items to skip when retrieving a list.",
///             "title": "offset"
///         },
///         "limit": {
///             "type": "number",
///             "description": "Limit the number of items returned in the list.",
///             "title": "limit"
///         },
///         "order": {
///             "type": "string",
///             "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`.",
///             "title": "order"
///         },
///         "price_list_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a price list's ID to retrieve its associated products.",
///                     "title": "price_list_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "Filter by a price list IDs to retrieve their associated products.",
///                         "title": "price_list_id"
///                     },
///                     "description": "The product's price list id."
///                 }
///             ]
///         },
///         "q": {
///             "type": "string",
///             "description": "Search term to filter a product's searchable properties.",
///             "title": "q"
///         },
///         "status": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a product status.",
///                     "title": "status"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "enum": [
///                             "draft",
///                             "proposed",
///                             "published",
///                             "rejected"
///                         ],
///                         "type": "string"
///                     },
///                     "description": "Filter by product statuses."
///                 }
///             ]
///         },
///         "sales_channel_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a sales channel's ID to retrieve its associated products.",
///                     "title": "sales_channel_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A sales channel's ID.",
///                         "title": "sales_channel_id"
///                     },
///                     "description": "Filter by sales channel IDs to retrieve their associated products."
///                 }
///             ]
///         },
///         "title": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a title.",
///                     "title": "title"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A product title.",
///                         "title": "title"
///                     },
///                     "description": "Filter by titles"
///                 }
///             ]
///         },
///         "handle": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a handle.",
///                     "title": "handle"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A product handle.",
///                         "title": "handle"
///                     },
///                     "description": "Filter by handles."
///                 }
///             ]
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a product ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A product's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by product IDs."
///                 }
///             ]
///         },
///         "is_giftcard": {
///             "type": "boolean",
///             "description": "Filter by whether a product is a gift card.",
///             "title": "is_giftcard"
///         },
///         "tags": {
///             "description": "Filter by associated tags to retrieve their products."
///         },
///         "type_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a product type's ID to retrieve its associated products.",
///                     "title": "type_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A product type's ID.",
///                         "title": "type_id"
///                     },
///                     "description": "Filter by product type IDs to retrieve their associated products."
///                 }
///             ]
///         },
///         "category_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a product category's ID to retrieve its associated products.",
///                     "title": "category_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A product category's ID.",
///                         "title": "category_id"
///                     },
///                     "description": "Filter by product category IDs to retrieve their associated products."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a product's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a product's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a product's deletion date."
///         },
///         "$and": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "Join query parameters with an AND condition. Each object's content is the same type as the expected query parameters.",
///             "title": "$and"
///         },
///         "$or": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "Join query parameters with an OR condition. Each object's content is the same type as the expected query parameters.",
///             "title": "$or"
///         },
///         "collection_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a product collection ID.",
///                     "title": "collection_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A product collection's ID.",
///                         "title": "collection_id"
///                     },
///                     "description": "Filter by product collection IDs."
///                 }
///             ]
///         },
///         "variants": {
///             "type": "object",
///             "description": "Filter the retrieved products' variants."
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_products_query_parameters.freezed.dart';
part 'get_products_query_parameters.g.dart'; // GetProductsQueryParameters

@freezed
abstract class GetProductsQueryParameters with _$GetProductsQueryParameters {
  const GetProductsQueryParameters._();

  @jsonSerializable
  const factory GetProductsQueryParameters({
    /// fields
    @JsonKey(name: GetProductsQueryParameters.fieldsKey) required String fields,

    /// offset
    @JsonKey(name: GetProductsQueryParameters.offsetKey) required double offset,

    /// limit
    @JsonKey(name: GetProductsQueryParameters.limitKey) required double limit,

    /// order
    @JsonKey(name: GetProductsQueryParameters.orderKey) required String order,

    /// priceListId
    @JsonKey(name: GetProductsQueryParameters.priceListIdKey)
    required dynamic priceListId,

    /// q
    @JsonKey(name: GetProductsQueryParameters.qKey) required String q,

    /// status
    @JsonKey(name: GetProductsQueryParameters.statusKey)
    required dynamic status,

    /// salesChannelId
    @JsonKey(name: GetProductsQueryParameters.salesChannelIdKey)
    required dynamic salesChannelId,

    /// title
    @JsonKey(name: GetProductsQueryParameters.titleKey) required dynamic title,

    /// handle
    @JsonKey(name: GetProductsQueryParameters.handleKey)
    required dynamic handle,

    /// id
    @JsonKey(name: GetProductsQueryParameters.idKey) required dynamic id,

    /// isGiftcard
    @JsonKey(name: GetProductsQueryParameters.isGiftcardKey)
    required bool isGiftcard,

    /// tags
    @JsonKey(name: GetProductsQueryParameters.tagsKey) required dynamic tags,

    /// typeId
    @JsonKey(name: GetProductsQueryParameters.typeIdKey)
    required dynamic typeId,

    /// categoryId
    @JsonKey(name: GetProductsQueryParameters.categoryIdKey)
    required dynamic categoryId,

    /// createdAt
    @JsonKey(name: GetProductsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetProductsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetProductsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetProductsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetProductsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,

    /// collectionId
    @JsonKey(name: GetProductsQueryParameters.collectionIdKey)
    required dynamic collectionId,

    /// variants
    @JsonKey(name: GetProductsQueryParameters.variantsKey)
    required Map<String, dynamic> variants,
  }) = _GetProductsQueryParameters;

  factory GetProductsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetProductsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String priceListIdKey = r'price_list_id';

  static const String qKey = r'q';

  static const String statusKey = r'status';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String titleKey = r'title';

  static const String handleKey = r'handle';

  static const String idKey = r'id';

  static const String isGiftcardKey = r'is_giftcard';

  static const String tagsKey = r'tags';

  static const String typeIdKey = r'type_id';

  static const String categoryIdKey = r'category_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';

  static const String collectionIdKey = r'collection_id';

  static const String variantsKey = r'variants';
}
