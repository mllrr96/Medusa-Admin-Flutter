import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PriceListDetailsUseCase {
  final PriceListRepository _priceListRepository =
      getIt<MedusaAdmin>().priceListRepository;

  static PriceListDetailsUseCase get instance =>
      getIt<PriceListDetailsUseCase>();

  Future<Result<PriceList, Failure>> create(
      UserCreatePriceListReq userCreatePriceListReq) async {
    try {
      final result = await _priceListRepository.createPriceList(
          userCreatePriceListReq: userCreatePriceListReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<PriceList, Failure>> updatePrices({
    required UserUpdatePricesReq userUpdatePricesReq,
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.updatePrices(
          id: id, userUpdatePricesReq: userUpdatePricesReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserDeleteProductPricesRes, Failure>> deleteProductPrices({
    required String id,
    required String productId,
  }) async {
    try {
      final result = await _priceListRepository.deleteProductPrices(
          id: id, productId: productId);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserDeletePriceListRes, Failure>> delete({
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.deletePriceList(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<PriceList, Failure>> fetch({
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.retrievePriceList(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserPriceListsProductsRes, Failure>> fetchProducts({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _priceListRepository.retrievePriceListProducts(id: id, queryParameters:queryParameters );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
