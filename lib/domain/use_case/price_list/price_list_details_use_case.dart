import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PriceListCrudUseCase {
  PriceListRepository get _priceListRepository =>
      getIt<MedusaAdmin>().priceListRepository;

  static PriceListCrudUseCase get instance =>
      getIt<PriceListCrudUseCase>();

  Future<Result<PriceList, Failure>> create(
      CreatePriceListReq payload) async {
    try {
      final result = await _priceListRepository.createPriceList(
          userCreatePriceListReq: payload);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<PriceList, Failure>> update({
    required UpdatePriceListReq payload,
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.updatePriceList(
          id: id, userUpdatePriceListReq: payload);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<PriceList, Failure>> updatePrices({
    required UpdatePricesReq payload,
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.updatePrices(
          id: id, userUpdatePricesReq: payload);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<DeleteProductPricesRes, Failure>> deleteProductPrices({
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

  Future<Result<DeletePriceListRes, Failure>> delete({
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

  Future<Result<PriceListsRes, Failure>> fetchAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _priceListRepository.retrievePriceLists(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<PriceListsProductsRes, Failure>> fetchProducts({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _priceListRepository.retrievePriceListProducts(
          id: id, queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
