import 'package:dartz/dartz.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/store_post_search_req.dart';
import '../../models/req/user_post_product_req.dart';
import '../../models/res/products.dart';
import '../../models/store/product.dart';

abstract class BaseProducts {
  Future<Either<UserProductsListRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  Future<UserProductsRes?> retrieve(String id,
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  Future<UserVariantsRes?> retrieveVariants(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  Future<UserPostSearchRes?> search({StorePostSearchReq? req, Map<String, dynamic>? customHeaders});

  Future<Either<Product, Failure>> add(
      {required UserPostProductReq userPostProductReq, Map<String, dynamic>? customHeaders});

  Future<Either<UserDeleteProductRes, Failure>> delete(
      {required String id, Map<String, dynamic>? customHeaders});

  Future<Either<UserUpdateProductRes, Failure>> update(
      {required Product product, Map<String, dynamic>? customHeaders});

}