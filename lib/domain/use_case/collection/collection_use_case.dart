import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CollectionUseCase {
  static CollectionUseCase get instance => getIt<CollectionUseCase>();
  CollectionRepository get _collectionsRepository =>
      getIt<MedusaAdmin>().collectionRepository;

  Future<Result<ProductCollection, Failure>> create({
    required CreateCollectionReq userCreateCollectionReq,
  }) async {
    try {
      final result = await _collectionsRepository.create(
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
      final result = await _collectionsRepository.update(id: id, userCreateCollectionReq: userCreateCollectionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<CollectionsRes, Failure>> retrieveAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _collectionsRepository.retrieveAll(queryParameters:queryParameters );
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
