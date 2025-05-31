library;

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/models.dart';
part 'sales_channels_client.g.dart';

@RestApi()
abstract class SalesChannelsClient {
  factory SalesChannelsClient(
    Dio dio, {
    ParseErrorLogger? errorLogger,
    String? baseUrl,
  }) = _SalesChannelsClient;

  /// get
  /// {
  ///     "tags": [
  ///         "Sales Channels"
  ///     ],
  ///     "summary": "List Sales Channels",
  ///     "description": "Retrieve a list of sales channels. The sales channels can be filtered by fields such as `id`. The sales channels can also be sorted or paginated.",
  ///     "operationId": "GetSalesChannels",
  ///     "security": [
  ///         {
  ///             "api_token": []
  ///         },
  ///         {
  ///             "cookie_auth": []
  ///         },
  ///         {
  ///             "jwt_token": []
  ///         }
  ///     ],
  ///     "parameters": [
  ///         {
  ///             "name": "fields",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
  ///                 "title": "fields"
  ///             },
  ///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields."
  ///         },
  ///         {
  ///             "name": "offset",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "number",
  ///                 "description": "The number of items to skip when retrieving a list.",
  ///                 "title": "offset"
  ///             },
  ///             "description": "The number of items to skip when retrieving a list."
  ///         },
  ///         {
  ///             "name": "limit",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "number",
  ///                 "description": "Limit the number of items returned in the list.",
  ///                 "title": "limit"
  ///             },
  ///             "description": "Limit the number of items returned in the list."
  ///         },
  ///         {
  ///             "name": "order",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`.",
  ///                 "title": "order"
  ///             },
  ///             "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`."
  ///         },
  ///         {
  ///             "name": "q",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Search term to filter the sales channel's searchable properties.",
  ///                 "title": "q"
  ///             },
  ///             "description": "Search term to filter the sales channel's searchable properties."
  ///         },
  ///         {
  ///             "name": "id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a sales channel ID.",
  ///                         "title": "id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A sales channel ID.",
  ///                             "title": "id"
  ///                         },
  ///                         "description": "Filter by sales channel IDs."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "name",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a sales channel name.",
  ///                         "title": "name"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A sales channel name.",
  ///                             "title": "name"
  ///                         },
  ///                         "description": "Filter by sales channel names."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "description",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Filter by a description. This filter matches an entire description. To search by terms or keywords, use the `q` query parameter instead.",
  ///                 "title": "description"
  ///             },
  ///             "description": "The sales channel's description."
  ///         },
  ///         {
  ///             "name": "is_disabled",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "boolean",
  ///                 "description": "Filter by whether the sales channel is disabled.",
  ///                 "title": "is_disabled"
  ///             },
  ///             "description": "Filter by whether the sales channel is disabled."
  ///         },
  ///         {
  ///             "name": "created_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "object",
  ///                 "description": "Filter by a sales channel's creation date."
  ///             },
  ///             "description": "Filter by a sales channel's creation date."
  ///         },
  ///         {
  ///             "name": "updated_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "object",
  ///                 "description": "Filter by a sales channel's update date."
  ///             },
  ///             "description": "Filter by a sales channel's update date."
  ///         },
  ///         {
  ///             "name": "deleted_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "object",
  ///                 "description": "Filter by a sales channel's deletion date."
  ///             },
  ///             "description": "Filter by a sales channel's deletion date."
  ///         },
  ///         {
  ///             "name": "location_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a location ID to retrieve its associated sales channels.",
  ///                         "title": "location_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A location ID.",
  ///                             "title": "location_id"
  ///                         },
  ///                         "description": "Filter by location IDs to retrieve their associated sales channels."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "publishable_key_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a publishable API key's ID to retrieve its associated sales channels.",
  ///                         "title": "publishable_key_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A publishable API key ID.",
  ///                             "title": "publishable_key_id"
  ///                         },
  ///                         "description": "Filter by publishable API key IDs to retrieve their associated sales channels."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "$and",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "array",
  ///                 "items": {
  ///                     "type": "object"
  ///                 },
  ///                 "description": "Join query parameters with an AND condition. Each object's content is the same type as the expected query parameters.",
  ///                 "title": "$and"
  ///             }
  ///         },
  ///         {
  ///             "name": "$or",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "array",
  ///                 "items": {
  ///                     "type": "object"
  ///                 },
  ///                 "description": "Join query parameters with an OR condition. Each object's content is the same type as the expected query parameters.",
  ///                 "title": "$or"
  ///             }
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {}
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @GET("/admin/sales-channels")
  Future<HttpResponse<dynamic>> getSalesChannels({
    @Queries() required GetSalesChannelsQueryParameters queries,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Sales Channels"
  ///     ],
  ///     "summary": "Create Sales Channel",
  ///     "description": "Create a sales channel.",
  ///     "operationId": "PostSalesChannels",
  ///     "security": [
  ///         {
  ///             "api_token": []
  ///         },
  ///         {
  ///             "cookie_auth": []
  ///         },
  ///         {
  ///             "jwt_token": []
  ///         }
  ///     ],
  ///     "parameters": [
  ///         {
  ///             "name": "fields",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
  ///                 "title": "fields"
  ///             },
  ///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminCreateSalesChannel"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminSalesChannelResponse"
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/sales-channels")
  Future<HttpResponse<AdminSalesChannelResponse>> postSalesChannels({
    @Body() required AdminCreateSalesChannel requestBody,
    @Queries() required PostSalesChannelsQueryParameters queries,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// get
  /// {
  ///     "tags": [
  ///         "Sales Channels"
  ///     ],
  ///     "summary": "Get a Sales Channel",
  ///     "description": "Retrieve a sales channel by its ID. You can expand the sales channel's relations or select the fields that should be returned.",
  ///     "operationId": "GetSalesChannelsId",
  ///     "security": [
  ///         {
  ///             "api_token": []
  ///         },
  ///         {
  ///             "cookie_auth": []
  ///         },
  ///         {
  ///             "jwt_token": []
  ///         }
  ///     ],
  ///     "parameters": [
  ///         {
  ///             "name": "id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The sales channel's ID."
  ///         },
  ///         {
  ///             "name": "fields",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
  ///                 "title": "fields"
  ///             },
  ///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminSalesChannelResponse"
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @GET("/admin/sales-channels/{id}")
  Future<HttpResponse<AdminSalesChannelResponse>> getSalesChannelsId({
    @Queries() required GetSalesChannelsIdQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Sales Channels"
  ///     ],
  ///     "summary": "Update a Sales Channel",
  ///     "description": "Update a sales channel's details.",
  ///     "operationId": "PostSalesChannelsId",
  ///     "security": [
  ///         {
  ///             "api_token": []
  ///         },
  ///         {
  ///             "cookie_auth": []
  ///         },
  ///         {
  ///             "jwt_token": []
  ///         }
  ///     ],
  ///     "parameters": [
  ///         {
  ///             "name": "id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The sales channel's ID."
  ///         },
  ///         {
  ///             "name": "fields",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
  ///                 "title": "fields"
  ///             },
  ///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminUpdateSalesChannel"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminSalesChannelResponse"
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/sales-channels/{id}")
  Future<HttpResponse<AdminSalesChannelResponse>> postSalesChannelsId({
    @Body() required AdminUpdateSalesChannel requestBody,
    @Queries() required PostSalesChannelsIdQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// delete
  /// {
  ///     "tags": [
  ///         "Sales Channels"
  ///     ],
  ///     "summary": "Delete a Sales Channel",
  ///     "description": "Delete a sales channel.",
  ///     "operationId": "DeleteSalesChannelsId",
  ///     "security": [
  ///         {
  ///             "api_token": []
  ///         },
  ///         {
  ///             "cookie_auth": []
  ///         },
  ///         {
  ///             "jwt_token": []
  ///         }
  ///     ],
  ///     "parameters": [
  ///         {
  ///             "name": "id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The sales channel's ID."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminSalesChannelDeleteResponse"
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @DELETE("/admin/sales-channels/{id}")
  Future<HttpResponse<AdminSalesChannelDeleteResponse>> deleteSalesChannelsId({
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Sales Channels"
  ///     ],
  ///     "summary": "Manage Products in Sales Channel",
  ///     "description": "Manage products in a sales channel to add or remove them from the channel.",
  ///     "operationId": "PostSalesChannelsIdProducts",
  ///     "security": [
  ///         {
  ///             "api_token": []
  ///         },
  ///         {
  ///             "cookie_auth": []
  ///         },
  ///         {
  ///             "jwt_token": []
  ///         }
  ///     ],
  ///     "parameters": [
  ///         {
  ///             "name": "id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The sales channel's ID."
  ///         },
  ///         {
  ///             "name": "fields",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
  ///                 "title": "fields"
  ///             },
  ///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "type": "object",
  ///                     "description": "The products to add or remove from the channel."
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminSalesChannelResponse"
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/sales-channels/{id}/products")
  Future<HttpResponse<AdminSalesChannelResponse>> postSalesChannelsIdProducts({
    @Body() required Map<String, dynamic> requestBody,
    @Queries() required PostSalesChannelsIdProductsQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });
}
