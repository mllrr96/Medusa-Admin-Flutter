import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/product_type.dart';
import 'package:medusa_admin/app/data/repository/product_type/base_product_type.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../service/dio_service.dart';

class ProductTypeRepo extends BaseProductType {
  final _dataProvider = DioService.instance.dio;

  @override
  Future<Result<UserRetrieveProductTypesRes, Failure>> retrieveProductTypes({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/product-types',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveProductTypesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
