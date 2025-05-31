library;

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/models.dart';
part 'fulfillment_providers_client.g.dart';

@RestApi()
abstract class FulfillmentProvidersClient {
  factory FulfillmentProvidersClient(
    Dio dio, {
    ParseErrorLogger? errorLogger,
    String? baseUrl,
  }) = _FulfillmentProvidersClient;

  /// get
  /// {
  ///     "tags": [
  ///         "Fulfillment Providers"
  ///     ],
  ///     "summary": "List Fulfillment Providers",
  ///     "description": "Retrieve a list of fulfillment providers. The fulfillment providers can be filtered by fields such as `id`. The fulfillment providers can also be sorted or paginated.",
  ///     "operationId": "GetFulfillmentProviders",
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
  ///                         "description": "Filter by a fulfillment provider's ID.",
  ///                         "title": "id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A fulfillment provider ID.",
  ///                             "title": "id"
  ///                         },
  ///                         "description": "Filter by fulfillment provider IDs."
  ///                     }
  ///                 ]
  ///             }
  ///         },
  ///         {
  ///             "name": "is_enabled",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "boolean",
  ///                 "description": "Filter by whether the fulfillment provider is enabled.",
  ///                 "title": "is_enabled"
  ///             },
  ///             "description": "Filter by whether the fulfillment provider is enabled."
  ///         },
  ///         {
  ///             "name": "q",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "type": "string",
  ///                 "description": "Search term to filter a fulfillment provider's searchable properties.",
  ///                 "title": "q"
  ///             },
  ///             "description": "Search term to filter a fulfillment provider's searchable properties."
  ///         },
  ///         {
  ///             "name": "stock_location_id",
  ///             "in": "query",
  ///             "required": false,
  ///             "schema": {
  ///                 "oneOf": [
  ///                     {
  ///                         "type": "string",
  ///                         "description": "Filter by associated stock location's ID.",
  ///                         "title": "stock_location_id"
  ///                     },
  ///                     {
  ///                         "type": "array",
  ///                         "items": {
  ///                             "type": "string",
  ///                             "description": "A stock location's ID.",
  ///                             "title": "stock_location_id"
  ///                         },
  ///                         "description": "Filter by associated stock location IDs."
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
  ///                         "$ref": "#/components/schemas/AdminFulfillmentProviderListResponse"
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
  @GET("/admin/fulfillment-providers")
  Future<HttpResponse<AdminFulfillmentProviderListResponse>>
  getFulfillmentProviders({
    @Queries() required GetFulfillmentProvidersQueryParameters queries,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// get
  /// {
  ///     "tags": [
  ///         "Fulfillment Providers"
  ///     ],
  ///     "summary": "List Fulfillment Options",
  ///     "description": "Retrieve the list of fulfillment options of a fulfillment provider. These options may be retrieved from an integrated third-party service.",
  ///     "operationId": "GetFulfillmentProvidersIdOptions",
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
  ///             "description": "The fulfillment provider's ID."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AdminFulfillmentProviderOptionsListResponse"
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
  @GET("/admin/fulfillment-providers/{id}/options")
  Future<HttpResponse<AdminFulfillmentProviderOptionsListResponse>>
  getFulfillmentProvidersIdOptions({
    @Path("id") required String id,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });
}
