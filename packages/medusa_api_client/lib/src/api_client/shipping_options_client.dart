library;

import 'package:dio/dio.dart';
import 'package:medusa_api_client/src/models/admin_batch_shipping_option_response.dart';
import 'package:retrofit/retrofit.dart';
import '../models/models.dart';
part 'shipping_options_client.g.dart';

@RestApi()
abstract class ShippingOptionsClient {
  factory ShippingOptionsClient(
    Dio dio, {
    ParseErrorLogger? errorLogger,
    String? baseUrl,
  }) = _ShippingOptionsClient;

  /// get
  /// {
  ///     "tags": [
  ///         "Shipping Options"
  ///     ],
  ///     "summary": "List Shipping Options",
  ///     "description": "Retrieve a list of shipping options. The shipping options can be filtered by fields such as `id`. The shipping options can also be sorted or paginated.",
  ///     "operationId": "GetShippingOptions",
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
  ///                         "description": "Filter by a shipping option ID.",
  ///                         "title": "id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A shipping option's ID.",
  ///                             "title": "id"
  ///                         },
  ///                         "description": "Filter by shipping option IDs."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "q",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Search term to filter the shipping option's searchable properties.",
  ///                 "title": "q"
  ///             },
  ///             "description": "Search term to filter the shipping option's searchable properties."
  ///         },
  ///         {
  ///             "name": "service_zone_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a service zone's ID to retrieve its associated shipping options.",
  ///                         "title": "service_zone_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A service zone ID.",
  ///                             "title": "service_zone_id"
  ///                         },
  ///                         "description": "Filter by service zone IDs to retrieve their associated shipping options."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "shipping_profile_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a shipping profile's ID to retrieve its associated shipping options.",
  ///                         "title": "shipping_profile_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A shipping profile ID.",
  ///                             "title": "shipping_profile_id"
  ///                         },
  ///                         "description": "Filter by shipping profile IDs to retrieve their associated shipping options."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "provider_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a fulfillment provider's ID to retrieve its associated shipping options.",
  ///                         "title": "provider_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A fulfillment provider ID.",
  ///                             "title": "provider_id"
  ///                         },
  ///                         "description": "Filter by fulfillment provider IDs to retrieve their associated shipping options."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "shipping_option_type_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a shipping option type's ID to retrieve its associated shipping options.",
  ///                         "title": "shipping_option_type_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A shipping option type ID.",
  ///                             "title": "shipping_option_type_id"
  ///                         },
  ///                         "description": "Filter by shipping option type IDs to retrieve its associated shipping options."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "created_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "object",
  ///                 "description": "Filter by a shipping option's creation date."
  ///             },
  ///             "description": "Filter by a shipping option's creation date."
  ///         },
  ///         {
  ///             "name": "updated_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "object",
  ///                 "description": "Filter by a shipping option's update date."
  ///             },
  ///             "description": "Filter by a shipping option's update date."
  ///         },
  ///         {
  ///             "name": "deleted_at",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "object",
  ///                 "description": "Filter by a shipping option's deletion date."
  ///             },
  ///             "description": "Filter by a shipping option's deletion date."
  ///         },
  ///         {
  ///             "name": "stock_location_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by a location ID to retrieve its associated shipping option.",
  ///                         "title": "stock_location_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A stock location's ID.",
  ///                             "title": "stock_location_id"
  ///                         },
  ///                         "description": "Filter by location IDs to retrieve their associated shipping option."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "is_return",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "boolean",
  ///                 "description": "Filter by whether the shipping option is used for returns.",
  ///                 "title": "is_return"
  ///             },
  ///             "description": "Filter by whether the shipping option is used for returns."
  ///         },
  ///         {
  ///             "name": "admin_only",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "boolean",
  ///                 "description": "Filter by whether the shipping option is used by admin users only.",
  ///                 "title": "admin_only"
  ///             },
  ///             "description": "Filter by whether the shipping option is used by admin users only."
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
  @GET("/admin/shipping-options")
  Future<HttpResponse<dynamic>> getShippingOptions({
    @Queries() required GetShippingOptionsQueryParameters queries,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Shipping Options"
  ///     ],
  ///     "summary": "Create Shipping Option",
  ///     "description": "Create a shipping option.",
  ///     "operationId": "PostShippingOptions",
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
  ///                     "$ref": "#/components/schemas/AdminCreateShippingOption"
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
  ///                         "$ref": "#/components/schemas/AdminShippingOptionResponse"
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
  @POST("/admin/shipping-options")
  Future<HttpResponse<AdminShippingOptionResponse>> postShippingOptions({
    @Body() required AdminCreateShippingOption requestBody,
    @Queries() required PostShippingOptionsQueryParameters queries,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// get
  /// {
  ///     "tags": [
  ///         "Shipping Options"
  ///     ],
  ///     "summary": "Get a Shipping Option",
  ///     "description": "Retrieve a shipping option by its ID. You can expand the shipping option's relations or select the fields that should be returned.",
  ///     "operationId": "GetShippingOptionsId",
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
  ///             "description": "The shipping option's ID."
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
  ///             "description": "Comma-separated fields that should be included in the returned data.\nif a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields.\nwithout prefix it will replace the entire default fields."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminShippingOptionResponse"
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
  @GET("/admin/shipping-options/{id}")
  Future<HttpResponse<AdminShippingOptionResponse>> getShippingOptionsId({
    @Queries() required GetShippingOptionsIdQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Shipping Options"
  ///     ],
  ///     "summary": "Update a Shipping Option",
  ///     "description": "Update a shipping option's details.",
  ///     "operationId": "PostShippingOptionsId",
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
  ///             "description": "The shipping option's ID."
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
  ///                     "description": "The properties to update in the shipping option."
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
  ///                         "$ref": "#/components/schemas/AdminShippingOptionResponse"
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
  @POST("/admin/shipping-options/{id}")
  Future<HttpResponse<AdminShippingOptionResponse>> postShippingOptionsId({
    @Body() required Map<String, dynamic> requestBody,
    @Queries() required PostShippingOptionsIdQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// delete
  /// {
  ///     "tags": [
  ///         "Shipping Options"
  ///     ],
  ///     "summary": "Delete a Shipping Option",
  ///     "description": "Delete a shipping option.",
  ///     "operationId": "DeleteShippingOptionsId",
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
  ///             "description": "The shipping option's ID."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminShippingOptionDeleteResponse"
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
  @DELETE("/admin/shipping-options/{id}")
  Future<HttpResponse<AdminShippingOptionDeleteResponse>>
  deleteShippingOptionsId({
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Shipping Options"
  ///     ],
  ///     "summary": "Manage the Rules of a Shipping Option",
  ///     "description": "Manage the rules of a shipping option to create, update, or delete them.",
  ///     "operationId": "PostShippingOptionsIdRulesBatch",
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
  ///             "description": "The shipping option's ID."
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
  ///                     "description": "The rules to create, update, or delete."
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
  ///                         "type": "object",
  ///                         "description": "The batch operation's result."
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
  @POST("/admin/shipping-options/{id}/rules/batch")
  Future<HttpResponse<AdminBatchShippingOptionResponse>> postShippingOptionsIdRulesBatch({
    @Body() required Map<String, dynamic> requestBody,
    @Queries() required PostShippingOptionsIdRulesBatchQueryParameters queries,
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });
}
