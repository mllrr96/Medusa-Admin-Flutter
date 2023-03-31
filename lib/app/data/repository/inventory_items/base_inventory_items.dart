import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_inventory_items_req.dart';
import '../../models/res/inventory_items.dart';

abstract class BaseInventoryItems {
  Future<Result<UserInventoryItemRes, Failure>> createInventoryLocationForInventoryItem({
    required String id,
    required UserCreateInventoryLocationForInventoryItemReq userCreateInventoryLocationForInventoryItemReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserStockLevelsOfLocationRes, Failure>> listStockLevelsOfLocation({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserInventoryItemRes, Failure>> retrieveInventoryItem({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
  Future<Result<UserDeleteInventoryItemRes, Failure>> deleteInventoryItem({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserInventoryItemsRes, Failure>> retrieveInventoryItems({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserInventoryItemRes, Failure>> updateInventoryItem({
    required String id,
    required UserUpdateInventoryItemReq userUpdateInventoryItemReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserInventoryItemRes, Failure>> deleteLocationLevelOfInventoryItem({
    required String id,
    required String locationId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserInventoryItemRes, Failure>> updateLocationLevelOfInventoryItem({
    required String id,
    required String locationId,
    int? stockedQuantity,
    int? incomingQuantity,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
}
