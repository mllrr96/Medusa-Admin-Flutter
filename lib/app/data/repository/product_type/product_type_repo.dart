import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/product_type.dart';
import 'package:medusa_admin/app/data/repository/product_type/base_product_type.dart';
import 'package:multiple_result/multiple_result.dart';

class ProductTypeRepo extends BaseProductType{
  @override
  Future<Result<UserRetrieveProductTypesRes, Failure>> retrieveProductTypes({Map<String, dynamic>? customHeaders}) {
    // TODO: implement retrieveProductTypes
    throw UnimplementedError();
  }

}