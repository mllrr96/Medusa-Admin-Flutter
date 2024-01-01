import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class CollectionUseCase {
  static CollectionUseCase get instance => getIt<CollectionUseCase>();
  final CollectionRepository _collectionsRepository =
      getIt<MedusaAdmin>().collectionRepository;

  Future<Result<ProductCollection, Failure>> create({
    required UserCreateCollectionReq userCreateCollectionReq,
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
    required UserCreateCollectionReq userCreateCollectionReq,
  }) async {
    try {
      final result = await _collectionsRepository.update(id: id, userCreateCollectionReq: userCreateCollectionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<UserCollectionsRes, Failure>> retrieveAll({
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
