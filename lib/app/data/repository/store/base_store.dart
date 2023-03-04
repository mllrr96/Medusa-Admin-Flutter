import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/app/data/models/req/store_post_req.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/store.dart';

abstract class BaseStore {
  Future<Result<UserStoreRes, Failure>> retrieve(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  Future<Result<UserStoreRes, Failure>> update(
      {required StorePostReq storePostReq, Map<String, dynamic>? customHeaders});
}
