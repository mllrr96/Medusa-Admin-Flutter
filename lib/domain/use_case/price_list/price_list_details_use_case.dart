import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PriceListCrudUseCase {
  PriceListsRepository get _priceListRepository => _medusaAdmin.priceLists;

  final MedusaAdminV2 _medusaAdmin;

  PriceListCrudUseCase(this._medusaAdmin);

  static PriceListCrudUseCase get instance => getIt<PriceListCrudUseCase>();

  Future<Result<PriceList, MedusaError>> create(CreatePriceListReq payload) async {
    try {
      final result = await _priceListRepository.create(payload);
      return Success(result.priceList);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<PriceList, MedusaError>> update({
    required UpdatePriceListReq payload,
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.update(id, payload);
      return Success(result.priceList);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<PriceList, MedusaError>> updatePrices({
    required UpdatePriceListReq payload,
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.update(id, payload);
      return Success(result.priceList);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  // Future<Result<DeleteProductPricesRes, MedusaError>> deleteProductPrices({
  Future<Result<bool, MedusaError>> deleteProductPrices({
    required String id,
    required String productId,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _priceListRepository.deleteProductPrices(id: id, productId: productId);
    //   return Success(result!);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error) {
    //   return Error(
    //       MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }

  Future<Result<PriceListsDeleteRes, MedusaError>> delete({
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.delete(id);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<PriceList, MedusaError>> fetch({
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.retrieve(id);
      return Success(result.priceList);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<PriceListsListRes, MedusaError>> fetchAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _priceListRepository.retrieveAll(queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<bool, MedusaError>> fetchProducts({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _priceListRepository.managePrices(
    //       id: id, queryParameters: queryParameters);
    //   return Success(result);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error) {
    //   return Error(
    //       MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }
}
