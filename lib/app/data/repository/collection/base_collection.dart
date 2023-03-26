import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_collection_req.dart';
import '../../models/res/collection.dart';

abstract class BaseCollection {
  /// Retrieve a list of Product Collection.
  Future<Result<UserCollectionsRes, Failure>> retrieveAll({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Retrieves a Product Collection.
  Future<Result<UserCollectionRes, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Creates a Product Collection.
  Future<Result<UserCreateCollectionRes, Failure>> create({
    required UserCreateCollectionReq userCreateCollectionReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Updates a Product Collection.
  Future<Result<UserCreateCollectionRes, Failure>> update({
    required String id,
    required UserCreateCollectionReq userCreateCollectionReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Deletes a Product Collection.
  Future<Result<UserDeleteCollectionRes, Failure>> delete({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates products associated with a Product Collection
  Future<Result<UserCollectionUpdateProductsRes, Failure>> updateProducts({
    required UserCollectionUpdateProductsReq userCollectionUpdateProductsReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Removes products associated with a Product Collection
  Future<Result<UserCollectionRemoveProductsRes, Failure>> removeProducts({
    required UserCollectionRemoveProductsReq userCollectionRemoveProductsReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
}
