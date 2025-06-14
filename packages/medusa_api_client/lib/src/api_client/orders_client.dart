library;

import 'package:dio/dio.dart';
import 'package:medusa_api_client/src/models/admin_order_item_list_response.dart';
import 'package:medusa_api_client/src/models/admin_order_list_response.dart';
import 'package:retrofit/retrofit.dart';
import '../models/models.dart';
part 'orders_client.g.dart';

@RestApi()
abstract class OrdersClient {
  factory OrdersClient(
    Dio dio, {
    ParseErrorLogger? errorLogger,
    String? baseUrl,
  }) = _OrdersClient;

  /// get
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "List Orders",
  ///     "description": "Retrieve a list of orders. The orders can be filtered by fields such as `id`. The orders can also be sorted or paginated.",
  ///     "operationId": "GetOrders",
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
  ///                         "description": "Filter by an order ID.",
  ///                         "title": "id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "An order's ID.",
  ///                             "title": "id"
  ///                         },
  ///                         "description": "Filter by order IDs."
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
  ///                         "description": "Filter by the order's status.",
  ///                         "title": "status"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "An order's status.",
  ///                             "title": "status"
  ///                         },
  ///                         "description": "Filter by order statuses."
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
  ///                 "description": "Filter by sales channel IDs to retrieve the orders associated with them."
  ///             },
  ///             "description": "Filter by sales channel IDs to retrieve the orders associated with them."
  ///         },
  ///         {
  ///             "name": "region_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "The order's region id.",
  ///                         "title": "region_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "The region id's details.",
  ///                             "title": "region_id"
  ///                         },
  ///                         "description": "The order's region id."
  ///                     }
  ///                 ]
  ///             },
  ///             "description": "Filter by region IDs to retrieve their associated orders."
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
  ///                 "description": "Filter by the order's creation date."
  ///             },
  ///             "description": "Filter by the order's creation date."
  ///         },
  ///         {
  ///             "name": "updated_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "object",
  ///                 "description": "Filter by the order's update date."
  ///             },
  ///             "description": "Filter by the order's update date."
  ///         },
  ///         {
  ///             "name": "customer_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "The order's customer id.",
  ///                         "title": "customer_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "The customer id's details.",
  ///                             "title": "customer_id"
  ///                         },
  ///                         "description": "The order's customer id."
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
  @GET("/admin/orders")
  Future<HttpResponse<AdminOrderListResponse>> getOrders({
    @Queries() GetOrdersQueryParameters? queries,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// get
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Get an Order",
  ///     "description": "Retrieve an order by its ID. You can expand the order's relations or select the fields that should be returned.",
  ///     "operationId": "GetOrdersId",
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
  ///             "description": "The order's ID."
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
  ///         },
  ///         {
  ///             "name": "id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "The order's ID.",
  ///                         "title": "id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "The id's ID.",
  ///                             "title": "id"
  ///                         },
  ///                         "description": "The order's ID."
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
  ///                         "description": "The order's status.",
  ///                         "title": "status"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "The status's details.",
  ///                             "title": "status"
  ///                         },
  ///                         "description": "The order's status."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "version",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "number",
  ///                 "description": "The order's version.",
  ///                 "title": "version"
  ///             },
  ///             "description": "The order's version."
  ///         },
  ///         {
  ///             "name": "created_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {}
  ///         },
  ///         {
  ///             "name": "updated_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {}
  ///         },
  ///         {
  ///             "name": "deleted_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {}
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @GET("/admin/orders/{id}")
  Future<HttpResponse<AdminOrderResponse>> getOrdersId({
    @Queries() required GetOrdersIdQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Update Order",
  ///     "description": "Update an order's details.",
  ///     "operationId": "PostOrdersId",
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
  ///             "description": "The order's ID."
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
  ///                     "$ref": "#/components/schemas/AdminUpdateOrder"
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
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}")
  Future<HttpResponse<AdminOrderResponse>> postOrdersId({
    @Body() required AdminUpdateOrder requestBody,
    @Queries() PostOrdersIdQueryParameters? queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Archive an Order",
  ///     "description": "Change the status of an order to archived.",
  ///     "operationId": "PostOrdersIdArchive",
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
  ///             "description": "The order's ID."
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
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}/archive")
  Future<HttpResponse<AdminOrderResponse>> postOrdersIdArchive({
    @Queries() required PostOrdersIdArchiveQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Cancel Order",
  ///     "description": "Cancel an order. The cancelation fails if:\n- The order has captured payments.\n\n\n- The order has refund payments.\n\n\n- The order has fulfillments that aren't canceled.\n",
  ///     "operationId": "PostOrdersIdCancel",
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
  ///             "description": "The order's ID."
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
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}/cancel")
  Future<HttpResponse<AdminOrderResponse>> postOrdersIdCancel({
    @Queries() required PostOrdersIdCancelQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// get
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "List Changes on an Order",
  ///     "description": "Retrieve a list of changes made on an order, including returns, exchanges, etc...\n\nThe changes can be filtered by fields like FILTER FIELDS. The changes can also be paginated.\n",
  ///     "operationId": "GetOrdersIdChanges",
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
  ///             "description": "The order's ID."
  ///         },
  ///         {
  ///             "name": "fields",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Comma-separated fields that should be included in the returned data.\nif a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields.\nwithout prefix it will replace the entire default fields.",
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
  ///                         "$ref": "#/components/schemas/AdminOrderChangesResponse"
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
  @GET("/admin/orders/{id}/changes")
  Future<HttpResponse<AdminOrderChangesResponse>> getOrdersIdChanges({
    @Queries() required GetOrdersIdChangesQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Complete Order",
  ///     "description": "Mark an order as completed.",
  ///     "operationId": "PostOrdersIdComplete",
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
  ///             "description": "The order's ID."
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
  ///                     "description": "Pass additional custom data to the API route. This data is passed to the underlying workflow under the `additional_data` parameter."
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
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}/complete")
  Future<HttpResponse<AdminOrderResponse>> postOrdersIdComplete({
    @Body() required Map<String, dynamic> requestBody,
    @Queries() required PostOrdersIdCompleteQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Create Credit Line for Order",
  ///     "description": "Create a credit line for an order.",
  ///     "operationId": "PostOrdersIdCreditLines",
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
  ///             "description": "The order's ID."
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
  ///                     "$ref": "#/components/schemas/AdminCreateOrderCreditLines"
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
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}/credit-lines")
  Future<HttpResponse<AdminOrderResponse>> postOrdersIdCreditLines({
    @Body() required AdminCreateOrderCreditLines requestBody,
    @Queries() required PostOrdersIdCreditLinesQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Create an Order Fulfillment",
  ///     "description": "Create a fulfillment for an order. The creation fails if the order is canceled.",
  ///     "operationId": "PostOrdersIdFulfillments",
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
  ///             "description": "The order's ID."
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
  ///                     "description": "The fulfillment's details."
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
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}/fulfillments")
  Future<HttpResponse<AdminOrderResponse>> postOrdersIdFulfillments({
    @Body() required dynamic requestBody,
    @Queries() required PostOrdersIdFulfillmentsQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Cancel Fulfillment",
  ///     "description": "Cancel an order's fulfillment. The fulfillment can't be canceled if it's shipped.",
  ///     "operationId": "PostOrdersIdFulfillmentsFulfillment_idCancel",
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
  ///             "description": "The order's ID."
  ///         },
  ///         {
  ///             "name": "fulfillment_id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The order's fulfillment id."
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
  ///                     "description": "The cancelation details."
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
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}/fulfillments/{fulfillment_id}/cancel")
  Future<HttpResponse<AdminOrderResponse>>
  postOrdersIdFulfillmentsFulfillmentIdCancel({
    @Body() required dynamic requestBody,
    @Queries()
    required PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParameters queries,
    @Path("id") required String id,
    @Path("fulfillment_id") required String fulfillmentId,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Mark a Fulfillment as Delivered.",
  ///     "description": "Mark an order's fulfillment as delivered.",
  ///     "operationId": "PostOrdersIdFulfillmentsFulfillment_idMarkAsDelivered",
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
  ///             "description": "The order's ID."
  ///         },
  ///         {
  ///             "name": "fulfillment_id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The fulfillment's ID."
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
  ///             "description": "Comma-separated fields that should be included in the returned data.\nIf a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields.\nWithout prefix it will replace the entire default fields."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}/fulfillments/{fulfillment_id}/mark-as-delivered")
  Future<HttpResponse<AdminOrderResponse>>
  postOrdersIdFulfillmentsFulfillmentIdMarkAsDelivered({
    @Queries()
    required PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParameters
    queries,
    @Path("id") required String id,
    @Path("fulfillment_id") required String fulfillmentId,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Create Shipment for an Order's Fulfillment",
  ///     "description": "Create a shipment for an order's fulfillment.",
  ///     "operationId": "PostOrdersIdFulfillmentsFulfillment_idShipments",
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
  ///             "description": "The order's ID."
  ///         },
  ///         {
  ///             "name": "fulfillment_id",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The fulfillment's ID."
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
  ///                     "description": "The shipment's details."
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
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}/fulfillments/{fulfillment_id}/shipments")
  Future<HttpResponse<AdminOrderResponse>>
  postOrdersIdFulfillmentsFulfillmentIdShipments({
    @Body() required dynamic requestBody,
    @Queries()
    required PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParameters
    queries,
    @Path("id") required String id,
    @Path("fulfillment_id") required String fulfillmentId,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// get
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "List Line Items",
  ///     "description": "Retrieve a list of line items in a order. The line items can be filtered by fields like FILTER FIELDS. The line items can also be paginated.",
  ///     "operationId": "GetOrdersIdLineItems",
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
  ///             "description": "The order's ID."
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
  ///         },
  ///         {
  ///             "name": "id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "The order's ID.",
  ///                         "title": "id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "The id's ID.",
  ///                             "title": "id"
  ///                         },
  ///                         "description": "The order's ID."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "item_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "The order's item id.",
  ///                         "title": "item_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "The item id's details.",
  ///                             "title": "item_id"
  ///                         },
  ///                         "description": "The order's item id."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "order_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "The order's order id.",
  ///                         "title": "order_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "The order id's details.",
  ///                             "title": "order_id"
  ///                         },
  ///                         "description": "The order's order id."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "version",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "number",
  ///                         "description": "The order's version.",
  ///                         "title": "version"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "number",
  ///                             "description": "The version's details.",
  ///                             "title": "version"
  ///                         },
  ///                         "description": "The order's version."
  ///                     }
  ///                 ]
  ///             }
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
  ///             "name": "order",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`.",
  ///                 "title": "order"
  ///             },
  ///             "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "type": "object",
  ///                         "description": "SUMMARY"
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
  @GET("/admin/orders/{id}/line-items")
  Future<HttpResponse<AdminOrderItemListResponse>> getOrdersIdLineItems({
    @Queries() required GetOrdersIdLineItemsQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// get
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Get Preview",
  ///     "description": "Retrieve a preview of an order using its associated change, such as an edit.",
  ///     "operationId": "GetOrdersIdPreview",
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
  ///             "description": "The order's ID."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminOrderPreviewResponse"
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
  @GET("/admin/orders/{id}/preview")
  Future<HttpResponse<AdminOrderPreviewResponse>> getOrdersIdPreview({
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Request Order Transfer",
  ///     "description": "Request an order to be transfered to another customer. The transfer is confirmed by sending a request to the [Accept Order Transfer](https://docs.medusajs.com/api/store#orders_postordersidtransferaccept) Store API route.",
  ///     "operationId": "PostOrdersIdTransfer",
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
  ///             "description": "The order's ID."
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
  ///                     "$ref": "#/components/schemas/AdminTransferOrder"
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
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}/transfer")
  Future<HttpResponse<AdminOrderResponse>> postOrdersIdTransfer({
    @Body() required AdminTransferOrder requestBody,
    @Queries() required PostOrdersIdTransferQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Orders"
  ///     ],
  ///     "summary": "Cancel Transfer Request",
  ///     "description": "Cancel a request to transfer an order to another customer.",
  ///     "operationId": "PostOrdersIdTransferCancel",
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
  ///             "description": "The order's ID."
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
  ///                         "$ref": "#/components/schemas/AdminOrderResponse"
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
  @POST("/admin/orders/{id}/transfer/cancel")
  Future<HttpResponse<AdminOrderResponse>> postOrdersIdTransferCancel({
    @Queries() required PostOrdersIdTransferCancelQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });
}
