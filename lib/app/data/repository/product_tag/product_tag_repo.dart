import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/product_tag.dart';
import 'package:medusa_admin/app/data/repository/product_tag/base_product_tag.dart';
import 'package:multiple_result/multiple_result.dart';

class ProductTagRepo extends BaseProductTag {
  @override
  Future<Result<UserRetrieveProductTagsRes, Failure>> retrieveProductTags({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement retrieveProductTags
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveTagsUsageNumberRes, Failure>> retrieveTagsUsageNumber({
    Map<String, dynamic>? customHeaders,
  }) {
    // TODO: implement retrieveTagsUsageNumber
    throw UnimplementedError();
  }
}
