import 'package:dartz/dartz.dart';
import 'package:medusa_admin/app/data/models/req/store_post_req.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/store.dart';
import '../../models/store/store.dart';

abstract class BaseStore {
  Future<Either<UserStoreRes, Failure>> retrieve(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  Future<Either<UserStoreRes, Failure>> update(
      {required StorePostReq storePostReq, Map<String, dynamic>? customHeaders});
}
