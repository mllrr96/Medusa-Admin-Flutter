import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/product_variant.dart';
import 'package:multiple_result/multiple_result.dart';
import 'base_product_variant.dart';
import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class ProductVariantRepo extends BaseProductVariant {
  final _dataProvider = DioClient(dio: Dio());

  @override
  Future<Result<UserRetrieveProductVariantsRes, Failure>> retrieveProductVariants({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/variants', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return Success(UserRetrieveProductVariantsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRetrieveVariantInventoryRes, Failure>> retrieveVariantInventory({
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    // TODO: implement retrieveVariantInventory
    throw UnimplementedError();
  }
}
