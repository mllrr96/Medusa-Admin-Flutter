import 'package:medusa_admin/app/data/models/res/tax_rate.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_tax_rate.dart';

abstract class BaseTaxRate {
  Future<Result<UserTaxRateRes, Failure>> createTaxRate({
    required UserCreateTaxRateReq userCreateTaxRateReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserRetrieveTaxRatesRes, Failure>> retrieveTaxRates({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserTaxRateRes, Failure>> retrieveTaxRate({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserTaxRateRes, Failure>> updateTaxRate({
    required String id,
    required UserUpdateTaxRateReq userUpdateTaxRateReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteTaxRateRes, Failure>> deleteTaxRate({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserTaxRateRes, Failure>> addTaxRateToProductType({
    required String id,
    required List<String> productTypeIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserTaxRateRes, Failure>> removeTaxRateToProductType({
    required String id,
    required List<String> productTypeIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserTaxRateRes, Failure>> addTaxRateToProducts({
    required String id,
    required List<String> productIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserTaxRateRes, Failure>> removeTaxRateFromProduct({
    required String id,
    required List<String> productIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserTaxRateRes, Failure>> addTaxRateToShippingOptions({
    required String id,
    required List<String> shippingOptionIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserTaxRateRes, Failure>> removeTaxRateToShippingOption({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the shipping options to remove association with this tax rate.
    required List<String> shippingOptionIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });
}
