library;

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/models.dart';
part 'draft_orders_client.g.dart';

@RestApi()
abstract class DraftOrdersClient {
  factory DraftOrdersClient(
    Dio dio, {
    ParseErrorLogger? errorLogger,
    String? baseUrl,
  }) = _DraftOrdersClient;

  /// get
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "List Draft Orders",
  ///     "description": "Retrieve a list of draft orders. The draft orders can be filtered by fields such as `id`. The draft orders can also be sorted or paginated.",
  ///     "operationId": "GetDraftOrders",
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
  ///             "name": "id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a draft order's ID.",
  ///                         "title": "id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A draft order's ID.",
  ///                             "title": "id"
  ///                         },
  ///                         "description": "Filter by draft order IDs."
  ///                     },
  ///                     {
  ///                         "type": "object",
  ///                         "description": "Filter by conditions on the draft order's ID."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "status",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a draft order's status.",
  ///                         "title": "status"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "The draft order status.",
  ///                             "title": "status"
  ///                         },
  ///                         "description": "Filter by draft order statuses."
  ///                     },
  ///                     {
  ///                         "type": "object",
  ///                         "description": "Filter by conditions on the status."
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
  ///             },
  ///             "description": "Join query parameters with an AND condition. Each object's content is the same type as the expected query parameters."
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
  ///             },
  ///             "description": "Join query parameters with an OR condition. Each object's content is the same type as the expected query parameters."
  ///         },
  ///         {
  ///             "name": "sales_channel_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "array",
  ///                 "items": {
  ///                     "type": "string",
  ///                     "description": "A sales channel's ID.",
  ///                     "title": "sales_channel_id"
  ///                 },
  ///                 "description": "Filter by the associated sales channels to retrieve its draft orders."
  ///             },
  ///             "description": "Filter by the associated sales channels to retrieve its draft orders."
  ///         },
  ///         {
  ///             "name": "region_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "The draft order's region id.",
  ///                         "title": "region_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "The region id's details.",
  ///                             "title": "region_id"
  ///                         },
  ///                         "description": "The draft order's region id."
  ///                     }
  ///                 ]
  ///             },
  ///             "description": "Filter by region IDs to retrieve their associated draft orders."
  ///         },
  ///         {
  ///             "name": "q",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Search term to filter the order's searchable properties.",
  ///                 "title": "q"
  ///             },
  ///             "description": "Search term to filter the order's searchable properties."
  ///         },
  ///         {
  ///             "name": "created_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "object",
  ///                 "description": "Filter by the draft order's creation date."
  ///             },
  ///             "description": "Filter by the draft order's creation date."
  ///         },
  ///         {
  ///             "name": "updated_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "object",
  ///                 "description": "Filter by the draft order's update date."
  ///             },
  ///             "description": "Filter by the draft order's update date."
  ///         },
  ///         {
  ///             "name": "customer_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "The draft order's customer id.",
  ///                         "title": "customer_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "The customer id's details.",
  ///                             "title": "customer_id"
  ///                         },
  ///                         "description": "The draft order's customer id."
  ///                     }
  ///                 ]
  ///             }
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminDraftOrderListResponse"
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
  @GET("/admin/draft-orders")
  Future<HttpResponse<AdminDraftOrderListResponse>> getDraftOrders({
    @Queries() required GetDraftOrdersQueryParameters queries,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Create Draft Order",
  ///     "description": "Create a draft order. This creates an order with the `is_draft_order` property enabled. You can later convert the draft order to an order.",
  ///     "operationId": "PostDraftOrders",
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
  ///                     "description": "The draft order's details."
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
  ///                         "$ref": "#/components/schemas/AdminDraftOrderResponse"
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
  @POST("/admin/draft-orders")
  Future<HttpResponse<AdminDraftOrderResponse>> postDraftOrders({
    @Body() required dynamic requestBody,
    @Queries() required PostDraftOrdersQueryParameters queries,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// get
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Get a Draft Order",
  ///     "description": "Retrieve a draft order by its ID. You can expand the draft order's relations or select the fields that should be returned using the query parameters.",
  ///     "operationId": "GetDraftOrdersId",
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
  ///             "description": "The draft order's ID."
  ///         },
  ///         {
  ///             "name": "fields",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Comma-separated fields that should be included in the returned data. If a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. Without prefix it will replace the entire default fields.",
  ///                 "title": "fields"
  ///             },
  ///             "description": "Comma-separated fields that should be included in the returned data.\nif a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields.\nwithout prefix it will replace the entire default fields."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminDraftOrderResponse"
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
  @GET("/admin/draft-orders/{id}")
  Future<HttpResponse<AdminDraftOrderResponse>> getDraftOrdersId({
    @Queries() required GetDraftOrdersIdQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Update a Draft Order",
  ///     "description": "Update a draft order's details. This doesn't include updating the draft order's items, shipping methods, or promotions. To update those, you need to create an edit that you can later request or confirm.",
  ///     "operationId": "PostDraftOrdersId",
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
  ///             "description": "The draft order's ID."
  ///         },
  ///         {
  ///             "name": "fields",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Comma-separated fields that should be included in the returned data. If a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. Without prefix it will replace the entire default fields.",
  ///                 "title": "fields"
  ///             },
  ///             "description": "Comma-separated fields that should be included in the returned data.\nif a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields.\nwithout prefix it will replace the entire default fields."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminUpdateDraftOrder"
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
  ///                         "$ref": "#/components/schemas/AdminDraftOrderResponse"
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
  @POST("/admin/draft-orders/{id}")
  Future<HttpResponse<AdminDraftOrderResponse>> postDraftOrdersId({
    @Body() required AdminUpdateDraftOrder requestBody,
    @Queries() required PostDraftOrdersIdQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Convert a Draft Order to an Order",
  ///     "description": "Convert a draft order to an order. This will finalize the draft order and create a new order with the same details.",
  ///     "operationId": "PostDraftOrdersIdConvertToOrder",
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
  ///             "description": "The draft order's ID."
  ///         },
  ///         {
  ///             "name": "fields",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Comma-separated fields that should be included in the returned data. If a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. Without prefix it will replace the entire default fields.",
  ///                 "title": "fields"
  ///             },
  ///             "description": "Comma-separated fields that should be included in the returned data.\nif a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields.\nwithout prefix it will replace the entire default fields."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/draft-orders/{id}/convert-to-order")
  Future<HttpResponse> postDraftOrdersIdConvertToOrder({
    @Queries() required PostDraftOrdersIdConvertToOrderQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Create a Draft Order Edit",
  ///     "description": "Create an edit on a draft order. This will allow you to make changes to the draft order's items, shipping methods, or promotions. Once you've made the necessar changes, you can later either request the edit (which requires a confirmation from the customer), or force-confirm the edit.",
  ///     "operationId": "PostDraftOrdersIdEdit",
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
  ///             "description": "The draft order's ID."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/draft-orders/{id}/edit")
  Future<HttpResponse> postDraftOrdersIdEdit({
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// delete
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Cancel Edit on Draft Order",
  ///     "description": "Cancel an unconfirmed edit on a draft order.",
  ///     "operationId": "DeleteDraftOrdersIdEdit",
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
  ///             "description": "The draft order's ID."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @DELETE("/admin/draft-orders/{id}/edit")
  Future<HttpResponse> deleteDraftOrdersIdEdit({
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Confirm an Edit on a Draft Order",
  ///     "description": "Confirm an edit on a draft order. This will apply the changes made to the draft order.",
  ///     "operationId": "PostDraftOrdersIdEditConfirm",
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
  ///             "description": "The draft order's ID."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/draft-orders/{id}/edit/confirm")
  Future<HttpResponse> postDraftOrdersIdEditConfirm({
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Add Item to Draft Order Edit",
  ///     "description": "Add an item to a draft order edit.",
  ///     "operationId": "PostDraftOrdersIdEditItems",
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
  ///             "description": "The draft order's ID."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminAddDraftOrderItems"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/draft-orders/{id}/edit/items")
  Future<HttpResponse> postDraftOrdersIdEditItems({
    @Body() required AdminAddDraftOrderItems requestBody,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Update Existing Item in Draft Order Edit",
  ///     "description": "Update an existing item in a draft order edit.",
  ///     "operationId": "PostDraftOrdersIdEditItemsItemItem_id",
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
  ///             "description": "The draft order's ID."
  ///         },
  ///         {
  ///             "name": "item_id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The item's ID."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminUpdateDraftOrderItem"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/draft-orders/{id}/edit/items/item/{item_id}")
  Future<HttpResponse> postDraftOrdersIdEditItemsItemItemId({
    @Body() required AdminUpdateDraftOrderItem requestBody,
    @Path("id") required String id,
    @Path("item_id") required String itemId,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Update New Item in Draft Order Edit",
  ///     "description": "Update a new item that was added to a draft order edit by the ID of the item's `ITEM_ADD` action.\n\nEvery item has an `actions` property, whose value is an array of actions. You can check the action's name using its `action` property, and use the value of the `id` property.\n",
  ///     "operationId": "PostDraftOrdersIdEditItemsAction_id",
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
  ///             "description": "The draft order's ID."
  ///         },
  ///         {
  ///             "name": "action_id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The ID of the item's `ITEM_ADD` action."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminUpdateDraftOrderItem"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/draft-orders/{id}/edit/items/{action_id}")
  Future<HttpResponse> postDraftOrdersIdEditItemsActionId({
    @Body() required AdminUpdateDraftOrderItem requestBody,
    @Path("id") required String id,
    @Path("action_id") required String actionId,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// delete
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Remove Item from Draft Order Edit",
  ///     "description": "Remove an order item from a draft order edit by the ID of the item's `ITEM_ADD` or `ITEM_UPDATE` action.\n\nEvery item has an `actions` property, whose value is an array of actions. You can check the action's name using its `action` property, and use the value of the `id` property.\n",
  ///     "operationId": "DeleteDraftOrdersIdEditItemsAction_id",
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
  ///             "description": "The draft order's ID."
  ///         },
  ///         {
  ///             "name": "action_id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The ID of the order item's `ITEM_ADD` or `ITEM_UPDATE` action."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @DELETE("/admin/draft-orders/{id}/edit/items/{action_id}")
  Future<HttpResponse> deleteDraftOrdersIdEditItemsActionId({
    @Path("id") required String id,
    @Path("action_id") required String actionId,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Add Promotions to Draft Order Edit",
  ///     "description": "Add promotions to a draft order edit.",
  ///     "operationId": "PostDraftOrdersIdEditPromotions",
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
  ///             "description": "The draft order's ID."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminAddDraftOrderPromotions"
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
  ///                         "$ref": "#/components/schemas/AdminDraftOrderPreviewResponse"
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
  @POST("/admin/draft-orders/{id}/edit/promotions")
  Future<HttpResponse<AdminDraftOrderPreviewResponse>>
  postDraftOrdersIdEditPromotions({
    @Body() required AdminAddDraftOrderPromotions requestBody,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// delete
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Remove Promotions from Draft Order Edit",
  ///     "description": "Remove specified promotions from a draft order edit.",
  ///     "operationId": "DeleteDraftOrdersIdEditPromotions",
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
  ///             "description": "The draft order's ID."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminRemoveDraftOrderPromotions"
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
  ///                         "$ref": "#/components/schemas/AdminDraftOrderPreviewResponse"
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
  @DELETE("/admin/draft-orders/{id}/edit/promotions")
  Future<HttpResponse<AdminDraftOrderPreviewResponse>>
  deleteDraftOrdersIdEditPromotions({
    @Body() required AdminRemoveDraftOrderPromotions requestBody,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Request Edit on Draft Order",
  ///     "description": "Change the status of a draft order's edit to be requested. Later, the edit can be confirmed or canceled.",
  ///     "operationId": "PostDraftOrdersIdEditRequest",
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
  ///             "description": "The draft order's ID."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/draft-orders/{id}/edit/request")
  Future<HttpResponse> postDraftOrdersIdEditRequest({
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Add Shipping Method to Draft Order Edit",
  ///     "description": "Add a shipping method to a draft order edit.",
  ///     "operationId": "PostDraftOrdersIdEditShippingMethods",
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
  ///             "description": "The draft order's ID."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminAddDraftOrderShippingMethod"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/draft-orders/{id}/edit/shipping-methods")
  Future<HttpResponse> postDraftOrdersIdEditShippingMethods({
    @Body() required AdminAddDraftOrderShippingMethod requestBody,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Update Existing Shipping Method in Draft Order Edit",
  ///     "description": "Update an existing shipping method in a draft order edit.",
  ///     "operationId": "PostDraftOrdersIdEditShippingMethodsMethodMethod_id",
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
  ///             "description": "The draft order's ID."
  ///         },
  ///         {
  ///             "name": "method_id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The ID of the shipping method."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminUpdateDraftOrderShippingMethod"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/draft-orders/{id}/edit/shipping-methods/method/{method_id}")
  Future<HttpResponse> postDraftOrdersIdEditShippingMethodsMethodMethodId({
    @Body() required AdminUpdateDraftOrderShippingMethod requestBody,
    @Path("id") required String id,
    @Path("method_id") required String methodId,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// delete
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Remove Shipping Method from Draft Order Edit",
  ///     "description": "Remove an existing shipping method from a draft order edit.",
  ///     "operationId": "DeleteDraftOrdersIdEditShippingMethodsMethodMethod_id",
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
  ///             "description": "The draft order's ID."
  ///         },
  ///         {
  ///             "name": "method_id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The shipping method's ID."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @DELETE("/admin/draft-orders/{id}/edit/shipping-methods/method/{method_id}")
  Future<HttpResponse> deleteDraftOrdersIdEditShippingMethodsMethodMethodId({
    @Path("id") required String id,
    @Path("method_id") required String methodId,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Update New Shipping Method in Draft Order Edit",
  ///     "description": "Update a new shipping method that was added to a draft order edit using the `ID` of the method's `SHIPPING_ADD` action.\n\nEvery shipping method has an `actions` property, whose value is an array of actions. You can check the action's name using its `action` property, and use the value of the `id` property.\n",
  ///     "operationId": "PostDraftOrdersIdEditShippingMethodsAction_id",
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
  ///             "description": "The draft order's ID."
  ///         },
  ///         {
  ///             "name": "action_id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The ID of the shipping method's `SHIPPING_ADD` action."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "$ref": "#/components/schemas/AdminUpdateDraftOrderActionShippingMethod"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/admin/draft-orders/{id}/edit/shipping-methods/{action_id}")
  Future<HttpResponse> postDraftOrdersIdEditShippingMethodsActionId({
    @Body() required AdminUpdateDraftOrderActionShippingMethod requestBody,
    @Path("id") required String id,
    @Path("action_id") required String actionId,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// delete
  /// {
  ///     "tags": [
  ///         "Draft Orders"
  ///     ],
  ///     "summary": "Remove New Shipping Method from Draft Order",
  ///     "description": "Remove a shipping method that was added to a draft order edit using the `ID` of the method's `SHIPPING_ADD` action.\n\nEvery shipping method has an `actions` property, whose value is an array of actions. You can check the action's name using its `action` property, and use the value of the `id` property.\n",
  ///     "operationId": "DeleteDraftOrdersIdEditShippingMethodsAction_id",
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
  ///             "description": "The draft order's ID."
  ///         },
  ///         {
  ///             "name": "action_id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The ID of the shipping method's `SHIPPING_ADD` action."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @DELETE("/admin/draft-orders/{id}/edit/shipping-methods/{action_id}")
  Future<HttpResponse> deleteDraftOrdersIdEditShippingMethodsActionId({
    @Path("id") required String id,
    @Path("action_id") required String actionId,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });
}
