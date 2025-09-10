import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CollectionUseCase {
  CollectionUseCase(this._medusaAdminV2);
  final MedusaAdminV2 _medusaAdminV2;
  CollectionsRepository get _collectionsRepository =>
      _medusaAdminV2.collections;

  static CollectionUseCase get instance => getIt<CollectionUseCase>();

  Future<Result<ProductCollection, MedusaError>> create({
    required CreateCollectionReq userCreateCollectionReq,
  }) async {
    try {
      final result =
          await _collectionsRepository.create(userCreateCollectionReq);
      return Success(result.collection);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductCollection, MedusaError>> update({
    required String id,
    required UpdateCollectionReq updateCollectionReq,
  }) async {
    try {
      final result =
          await _collectionsRepository.update(id, updateCollectionReq);
      return Success(result.collection);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<CollectionListRes, MedusaError>> retrieveAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _collectionsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
