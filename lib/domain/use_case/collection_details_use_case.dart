import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class CollectionDetailsUseCase {
  final CollectionRepository _conditionRepository =
      getIt<MedusaAdmin>().collectionRepository;
  static CollectionDetailsUseCase get instance =>
      getIt<CollectionDetailsUseCase>();
  Future<Result<UserDeleteCollectionRes, Failure>> deleteCollection(
      String collectionId) async {
    try {
      final result = await _conditionRepository.delete(id: collectionId);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductCollection, Failure>> getCollection(String collectionId,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _conditionRepository.retrieve(
          id: collectionId, queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserCollectionRemoveProductsRes, Failure>> removeProducts(
      UserCollectionRemoveProductsReq userCollectionRemoveProductsReq) async {
    try {
      final result = await _conditionRepository.removeProducts(
          userCollectionRemoveProductsReq: userCollectionRemoveProductsReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductCollection, Failure>> updateProducts(
      UserCollectionUpdateProductsReq userCollectionUpdateProductsReq) async {
    try {
      final result = await _conditionRepository.updateProducts(
          userCollectionUpdateProductsReq: userCollectionUpdateProductsReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
