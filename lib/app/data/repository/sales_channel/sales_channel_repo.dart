import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_sales_channel_req.dart';
import 'package:medusa_admin/app/data/models/res/sales_channel_res.dart';
import 'package:multiple_result/multiple_result.dart';
import 'base_sales_channel.dart';

class SalesChannelRepo extends BaseSalesChannel {
  @override
  Future<Result<UserAddProductsToSalesChannelRes, Failure>> addProductsToSalesChannel({
    required String id,
    required List<String> productIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement addProductsToSalesChannel
    throw UnimplementedError();
  }

  @override
  Future<Result<UserAssociateStockLocationToSalesChannelRes, Failure>> associateStockLocationToSalesChannel({
    required String id,
    required String locationId,
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement associateStockLocationToSalesChannel
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateSalesChannelRes, Failure>> create({
    required String name,
    String? description,
    String? isDisabled,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Result<UserSalesChannelDeleteRes, Failure>> delete({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRemoveProductsToSalesChannelRes, Failure>> removeProductsToSalesChannel({
    required String id,
    required List<String> productIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement removeProductsToSalesChannel
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRemoveStockLocationToSalesChannelRes, Failure>> removeStockLocationToSalesChannel({
    required String id,
    required String locationId,
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement removeStockLocationToSalesChannel
    throw UnimplementedError();
  }

  @override
  Future<Result<UserSalesChannelRetrieveRes, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement retrieve
    throw UnimplementedError();
  }

  @override
  Future<Result<UserSalesChannelRetrieveAllRes, Failure>> retrieveAll({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement retrieveAll
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveStockLocationsRes, Failure>> retrieveStockLocations({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement retrieveStockLocations
    throw UnimplementedError();
  }

  @override
  Future<Result<UserSalesChannelUpdateRes, Failure>> update({
    required String id,
    required UserSalesChannelUpdateReq userSalesChannelUpdateRes,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
