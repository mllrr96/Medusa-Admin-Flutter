import 'package:dartz/dartz.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';

import '../../models/req/user_create_region_req.dart';
import '../../models/res/regions.dart';

abstract class BaseRegions {
  /// Retrieves a list of Regions.
  Future<Either<UserRegionsRes, Failure>> retrieveAll({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a Region.
  Future<Either<UserRegionRes, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Creates a Region
  Future<Either<UserRegionRes, Failure>> create({
    required UserCreateRegionReq userCreateRegionReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });
}
