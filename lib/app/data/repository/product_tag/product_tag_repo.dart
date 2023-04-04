import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/product_tag.dart';
import 'package:medusa_admin/app/data/repository/product_tag/base_product_tag.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../service/dio_service.dart';

class ProductTagRepo extends BaseProductTag {
  final _dataProvider = DioService.instance.dio;

  @override
  Future<Result<UserRetrieveProductTagsRes, Failure>> retrieveProductTags({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/product-tags',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveProductTagsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserRetrieveTagsUsageNumberRes, Failure>> retrieveTagsUsageNumber({
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/products/tag-usage',
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveTagsUsageNumberRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
