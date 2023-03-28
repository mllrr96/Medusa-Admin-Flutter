import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/app/data/repository/currency/base_currency.dart';
import 'package:medusa_admin/app/data/service/dio_service.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/currency.dart';

class CurrencyRepo extends BaseCurrency {
  final _dataProvider = DioService.instance.dio;

  @override
  Future<Result<UserCurrencyRes, Failure>> retrieve(
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
        return Success(UserCurrencyRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
