import 'package:dartz/dartz.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_create_collection_req.dart';
import '../../models/req/user_post_collection_remove_products_req.dart';
import '../../models/req/user_post_collection_update_products_req.dart';
import '../../models/res/collection.dart';

abstract class BaseCollection {
  Future<Either<UserCollectionsRes, Failure>> retrieveAll(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  Future<Either<UserCollectionRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  Future<Either<UserCreateCollectionRes, Failure>> create(
      {required UserCreateCollectionReq userCreateCollectionReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});

  Future<Either<UserCreateCollectionRes, Failure>> update(
      {required String id,
      required UserCreateCollectionReq userCreateCollectionReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});

  Future<Either<UserCollectionUpdateProductsRes, Failure>> updateProducts(
      {required UserCollectionUpdateProductsReq userCollectionProductsReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});
  Future<Either<UserCollectionRemoveProductsRes, Failure>> removeProducts(
      {required UserCollectionRemoveProductsReq userCollectionProductsReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});
}
