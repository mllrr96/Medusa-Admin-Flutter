import 'package:dartz/dartz.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_create_collection_req.dart';
import '../../models/req/user_post_collection_remove_products_req.dart';
import '../../models/req/user_post_collection_update_products_req.dart';
import '../../models/res/collection.dart';

abstract class BaseCollection {
  /// Retrieve a list of Product Collection.
  Future<Either<UserCollectionsRes, Failure>> retrieveAll(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  /// Retrieves a Product Collection.
  Future<Either<UserCollectionRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  /// Creates a Product Collection.
  Future<Either<UserCreateCollectionRes, Failure>> create(
      {required UserCreateCollectionReq userCreateCollectionReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});

  /// Updates a Product Collection.
  Future<Either<UserCreateCollectionRes, Failure>> update(
      {required String id,
      required UserCreateCollectionReq userCreateCollectionReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});

  /// Deletes a Product Collection.
  Future<Either<UserDeleteCollectionRes, Failure>> delete({required String id, Map<String, dynamic>? customHeaders});

  /// Updates products associated with a Product Collection
  Future<Either<UserCollectionUpdateProductsRes, Failure>> updateProducts(
      {required UserCollectionUpdateProductsReq userCollectionUpdateProductsReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});

  /// Removes products associated with a Product Collection
  Future<Either<UserCollectionRemoveProductsRes, Failure>> removeProducts(
      {required UserCollectionRemoveProductsReq userCollectionRemoveProductsReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});
}
