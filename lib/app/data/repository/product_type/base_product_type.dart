import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/product_type.dart';

abstract class BaseProductType{
  /// Retrieve a list of Product Types.
  Future<Result<UserRetrieveProductTypesRes, Failure>> retrieveProductTypes({
    Map<String, dynamic>? customHeaders,
  });
}