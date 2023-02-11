import 'package:dartz/dartz.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/currency.dart';

abstract class BaseCurrency{
  Future<Either<UserCurrencyRes, Failure>> retrieve(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});
}