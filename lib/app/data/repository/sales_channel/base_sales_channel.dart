import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_sales_channel_req.dart';
import '../../models/res/sales_channel_res.dart';

abstract class BaseSalesChannel {
  /// Retrieves a list of sales channels
  Future<Result<UserSalesChannelRetrieveAllRes, Failure>> retrieveAll({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves the sales channel.
  Future<Result<UserSalesChannelRetrieveRes, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Assign a batch of product to a sales channel.
  Future<Result<UserAddProductsToSalesChannelRes, Failure>> addProductsToSalesChannel({
    /// The ID of the Sales channel.
    required String id,

    /// The IDs of the products to add to the Sales Channel
    required List<String> productIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Remove a list of products from a sales channel.
  Future<Result<UserRemoveProductsFromSalesChannelRes, Failure>> removeProductsFromSalesChannel({
    /// The ID of the Sales channel.
    required String id,

    /// The IDs of the products to delete from the Sales Channel.
    required List<String> productIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Associates a stock location to a Sales Channel.
  Future<Result<UserAssociateStockLocationToSalesChannelRes, Failure>> associateStockLocationToSalesChannel({
    /// The ID of the Sales channel.
    required String id,
    /// The ID of the stock location
    required String locationId,
    Map<String, dynamic>? customHeaders,
  });

  /// Removes a stock location to a Sales Channel.
  Future<Result<UserRemoveStockLocationFromSalesChannelRes, Failure>> removeStockLocationFromSalesChannel({
    /// The ID of the Sales channel.
    required String id,
    /// The ID of the stock location
    required String locationId,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates a Sales Channel.
  Future<Result<UserSalesChannelUpdateRes, Failure>> update({
    required String id,
    required UserSalesChannelUpdateReq userSalesChannelUpdateRes,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Creates a Sales Channel.
  Future<Result<UserCreateSalesChannelRes, Failure>> create({
    required  UserSalesChannelCreateReq userSalesChannelCreateReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Deletes the sales channel.
  Future<Result<UserSalesChannelDeleteRes, Failure>> delete({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a list of stock locations
  Future<Result<UserRetrieveStockLocationsRes, Failure>> retrieveStockLocations({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });
}
