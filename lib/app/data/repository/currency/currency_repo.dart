import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/repository/currency/base_currency.dart';

import '../../datasource/remote/dio/dio_client.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/currency.dart';
import '../../service/storage_service.dart';

class CurrencyRepo extends BaseCurrency {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);

  @override
  Future<Either<UserCurrencyRes, Failure>> retrieve(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/currencies',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Left(UserCurrencyRes.fromJson(response.data));
      } else {
        return right(Failure(error: ''));
      }
    } catch (e) {
      return right(Failure(error: e));
    }
  }
}
