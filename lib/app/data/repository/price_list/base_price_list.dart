import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_price_list_req.dart';
import '../../models/res/price_list.dart';

abstract class BasePriceList {
  Future<Result<UserPriceListRes, Failure>> createPriceList({
    required UserCreatePriceListReq userCreatePriceListReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserPriceListRes, Failure>> updatePriceList({
    required String id,
    required UserUpdatePriceListReq userUpdatePriceListReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserPriceListRes, Failure>> updatePrices({
    required String id,
    required UserUpdatePricesReq userUpdatePricesReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserPriceListsRes, Failure>> retrievePriceLists({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserPriceListsRes, Failure>> retrievePriceListProducts({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserPriceListRes, Failure>> retrievePriceList({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeletePricesRes, Failure>> deletePrices({
    required String id,

    required List<String> priceIds,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeletePriceListRes, Failure>> deletePriceList({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteProductPricesRes, Failure>> deleteProductPrices({
    required String id,

    required String productId,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteVariantPricesRes, Failure>> deleteVariantPrices({
    required String id,

    required String variantId,
    Map<String, dynamic>? customHeaders,
  });
}
