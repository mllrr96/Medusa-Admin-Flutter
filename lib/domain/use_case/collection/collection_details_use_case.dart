import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CollectionCrudUseCase {
  CollectionsRepository get _collectionRepository => _medusaAdminV2.collections;
  final MedusaAdminV2 _medusaAdminV2;

  CollectionCrudUseCase(this._medusaAdminV2);

  static CollectionCrudUseCase get instance => getIt<CollectionCrudUseCase>();

  Future<Result<bool, MedusaError>> deleteCollection(String collectionId) async {
    try {
      await _collectionRepository.delete(collectionId);
      return Success(true);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductCollection, MedusaError>> getCollection(String collectionId,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _collectionRepository.retrieve(collectionId);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<CollectionListRes, MedusaError>> getCollections(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _collectionRepository.retrieveAll(queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductCollection, MedusaError>> removeProducts(
      String id, List<String> productIds) async {
    try {
      final result = await _collectionRepository.removeProducts(
        id,
        productIds,
      );
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
  Future<Result<ProductCollection, MedusaError>> addProducts(
      String id, List<String> productIds) async {
    try {
      final result = await _collectionRepository.addProducts(
        id,
        productIds,
      );
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductCollection, MedusaError>> updateProducts(
      // CollectionUpdateProductsReq userCollectionUpdateProductsReq
      ) async {
    throw UnimplementedError();
    // try {
    //   final result = await _collectionRepository.updateProducts(
    //       userCollectionUpdateProductsReq: userCollectionUpdateProductsReq);
    //   return Success(result);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error) {
    //   return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }

  Future<Result<ProductCollection, MedusaError>> create({
    required CreateCollectionReq userCreateCollectionReq,
  }) async {
    try {
      final result =
          await _collectionRepository.create(userCreateCollectionReq);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductCollection, MedusaError>> update({
    required String id,
    required UpdateCollectionReq updateCollectionReq,
  }) async {
    try {
      final result = await _collectionRepository.update(
          id, updateCollectionReq);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
