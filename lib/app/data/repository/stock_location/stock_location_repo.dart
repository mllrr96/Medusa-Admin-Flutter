import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/stock_location.dart';
import 'package:medusa_admin/app/data/models/res/stock_location.dart';
import 'package:multiple_result/multiple_result.dart';
import 'base_stock_location.dart';

class StockLocationRepo extends BaseStockLocation{
  @override
  Future<Result<UserCreateStockLocationRes, Failure>> createStockLocation({required UserCreateStockLocationReq userCreateStockLocationReq, Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement createStockLocation
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpdateStockLocationRes, Failure>> deleteStockLocation({required String id, Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement deleteStockLocation
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveStockLocationRes, Failure>> retrieveStockLocation({required String id, Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement retrieveStockLocation
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpdateStockLocationRes, Failure>> updateStockLocation({required String id, Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement updateStockLocation
    throw UnimplementedError();
  }

}