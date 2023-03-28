import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/stock_location.dart';
import '../../models/res/stock_location.dart';

abstract class BaseStockLocation {
  /// Creates a Stock Location.
  Future<Result<UserCreateStockLocationRes, Failure>> createStockLocation({
    required UserCreateStockLocationReq userCreateStockLocationReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves the Stock Location.
  Future<Result<UserRetrieveStockLocationRes, Failure>> retrieveStockLocation({
    /// The ID of the Stock Location.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates a Stock Location.
  Future<Result<UserUpdateStockLocationRes, Failure>> updateStockLocation({
    /// The ID of the Stock Location.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
  /// Updates a Stock Location.
  Future<Result<UserUpdateStockLocationRes, Failure>> deleteStockLocation({
    /// The ID of the Stock Location.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
}
