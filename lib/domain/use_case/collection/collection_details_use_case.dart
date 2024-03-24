import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CollectionCrudUseCase {
  CollectionRepository get _collectionRepository =>
      getIt<MedusaAdmin>().collectionRepository;
  static CollectionCrudUseCase get instance =>
      getIt<CollectionCrudUseCase>();
  Future<Result<DeleteCollectionRes, Failure>> deleteCollection(
      String collectionId) async {
    try {
      final result = await _collectionRepository.delete(id: collectionId);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductCollection, Failure>> getCollection(String collectionId,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _collectionRepository.retrieve(
          id: collectionId, queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<CollectionsRes, Failure>> getCollections(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _collectionRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<CollectionRemoveProductsRes, Failure>> removeProducts(
      CollectionRemoveProductsReq userCollectionRemoveProductsReq) async {
    try {
      final result = await _collectionRepository.removeProducts(
          userCollectionRemoveProductsReq: userCollectionRemoveProductsReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductCollection, Failure>> updateProducts(
      CollectionUpdateProductsReq userCollectionUpdateProductsReq) async {
    try {
      final result = await _collectionRepository.updateProducts(
          userCollectionUpdateProductsReq: userCollectionUpdateProductsReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }


  Future<Result<ProductCollection, Failure>> create({
    required CreateCollectionReq userCreateCollectionReq,
  }) async {
    try {
      final result = await _collectionRepository.create(
          userCreateCollectionReq: userCreateCollectionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductCollection, Failure>> update({
    required String id,
    required CreateCollectionReq userCreateCollectionReq,
  }) async {
    try {
      final result = await _collectionRepository.update(id: id, userCreateCollectionReq: userCreateCollectionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

}
