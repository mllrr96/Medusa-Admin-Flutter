import 'package:dartz/dartz.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';

import '../../models/req/user_create_region_req.dart';
import '../../models/res/regions.dart';

abstract class BaseRegions {
  Future<Either<UserRegionsRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  Future<Either<UserRegionRes, Failure>> retrieve(
      {
      /// The ID of the Region.
      required String id,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders});

  Future<Either<UserRegionRes, Failure>> create(
      {required UserCreateRegionReq userCreateRegionReq,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders});
}
