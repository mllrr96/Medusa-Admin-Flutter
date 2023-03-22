import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';

import '../../models/req/user_create_region_req.dart';
import '../../models/res/regions.dart';

abstract class BaseRegions {
  /// Retrieves a list of Regions.
  Future<Result<UserRegionsRes, Failure>> retrieveAll({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a Region.
  Future<Result<UserRegionRes, AltFailure>> retrieve({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Creates a Region
  Future<Result<UserRegionRes, Failure>> create({
    required UserCreateRegionReq userCreateRegionReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });
}
