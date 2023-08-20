import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/store_post_search_req.dart';
import '../../models/req/user_post_product_req.dart';
import '../../models/res/products.dart';
import '../../models/store/product.dart';

abstract class BaseProducts {
  Future<Result<UserProductsListRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders});

  Future<UserProductsRes?> retrieve(String id,
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  Future<UserVariantsRes?> retrieveVariants(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  Future<UserPostSearchRes?> search({StorePostSearchReq? req, Map<String, dynamic>? customHeaders});

  Future<Result<Product, Failure>> add(
      {required UserPostProductReq userPostProductReq, Map<String, dynamic>? customHeaders});

  Future<Result<UserDeleteProductRes, Failure>> delete(
      {required String id, Map<String, dynamic>? customHeaders});

  Future<Result<UserUpdateProductRes, Failure>> update(
      {required UserPostUpdateProductReq userPostUpdateProductReq,
        required String id,
        Map<String, dynamic>? customHeaders});

}