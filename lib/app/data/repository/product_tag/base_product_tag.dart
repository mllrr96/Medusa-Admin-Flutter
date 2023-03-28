import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/product_tag.dart';

abstract class BaseProductTag{
  /// Retrieves a list of Product Tags with how many times each is used.
  Future<Result<UserRetrieveTagsUsageNumberRes, Failure>> retrieveTagsUsageNumber({
    Map<String, dynamic>? customHeaders,
  });
  /// Retrieve a list of Product Tags.
  Future<Result<UserRetrieveProductTagsRes, Failure>> retrieveProductTags({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

}