import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_inventory_items_req.dart';
import 'package:medusa_admin/app/data/models/res/inventory_items.dart';
import 'package:medusa_admin/app/data/repository/inventory_items/base_inventory_items.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../service/dio_service.dart';

class InventoryItemsRepo extends BaseInventoryItems {
  final _dataProvider = DioService.instance.dio;

  /// Creates an Inventory Location Level for a given Inventory Item.
  @override
  Future<Result<UserInventoryItemRes, Failure>> createInventoryLocationForInventoryItem({
    /// The ID of the Inventory Item.
    required String id,
    required UserCreateInventoryLocationForInventoryItemReq userCreateInventoryLocationForInventoryItemReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/inventory-items/$id/location-levels',
        data: userCreateInventoryLocationForInventoryItemReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserInventoryItemRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Delete an Inventory Item
  @override
  Future<Result<UserDeleteInventoryItemRes, Failure>> deleteInventoryItem({
    /// The ID of the Inventory Item to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/inventory-items/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteInventoryItemRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Delete a location level of an Inventory Item.
  @override
  Future<Result<UserInventoryItemRes, Failure>> deleteLocationLevelOfInventoryItem({
    /// The ID of the Inventory Item.
    required String id,

    /// The ID of the location.
    required String locationId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/inventory-items/$id/location-levels/$locationId',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserInventoryItemRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Lists stock levels of a given location.
  @override
  Future<Result<UserStockLevelsOfLocationRes, Failure>> listStockLevelsOfLocation({
    /// The ID of the Inventory Item.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/inventory-items/$id/location-levels',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserStockLevelsOfLocationRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves an Inventory Item.
  @override
  Future<Result<UserInventoryItemRes, Failure>> retrieveInventoryItem({
    /// The ID of the Inventory Item.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/inventory-items/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserInventoryItemRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Lists inventory items.
  @override
  Future<Result<UserInventoryItemsRes, Failure>> retrieveInventoryItems({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/inventory-items',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserInventoryItemsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates an Inventory Item.
  @override
  Future<Result<UserInventoryItemRes, Failure>> updateInventoryItem({
    /// The ID of the Inventory Item.
    required String id,
    required UserUpdateInventoryItemReq userUpdateInventoryItemReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/inventory-items',
        data: userUpdateInventoryItemReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserInventoryItemRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates an Inventory Location Level for a given Inventory Item.
  @override
  Future<Result<UserInventoryItemRes, Failure>> updateLocationLevelOfInventoryItem({
    /// The ID of the Inventory Item.
    required String id,

    /// The ID of the location.
    required String locationId,

    /// the total stock quantity of an inventory item at the given location ID
    int? stockedQuantity,

    /// the incoming stock quantity of an inventory item at the given location ID
    int? incomingQuantity,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/inventory-items/$id/location-levels/$locationId',
        data: {
          if (stockedQuantity != null) 'stocked_quantity': stockedQuantity,
          if (incomingQuantity != null) 'incoming_quantity': incomingQuantity,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserInventoryItemRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
