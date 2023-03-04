import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/currency.dart';

abstract class BaseCurrency{
  Future<Result<UserCurrencyRes, Failure>> retrieve(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});
}